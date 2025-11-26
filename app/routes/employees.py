# routes/employees.py
from flask import (
    Blueprint, render_template, request, redirect, url_for,
    flash, send_file, current_app,jsonify
)
from flask_login import login_required, current_user
from app import db
from app.models.employees import Employee
from datetime import datetime, date
from docxtpl import DocxTemplate
import io
import os
import zipfile
from markupsafe import Markup
from sqlalchemy import or_
import re
import mammoth

employees_bp = Blueprint('employees', __name__)

# ----------------------------------------------------------------------
# Helper Functions
# ----------------------------------------------------------------------
def format_date_for_docx(date_obj: date | None) -> str:
    """Format date like: 1ˢᵗ January 2025"""
    if not date_obj:
        return ''
    day = date_obj.day
    suffix = 'th' if 11 <= day % 100 <= 13 else {1: 'st', 2: 'nd', 3: 'rd'}.get(day % 10, 'th')
    superscripts = {"st": "ˢᵗ", "nd": "ⁿᵈ", "rd": "ʳᵈ", "th": "ᵗʰ"}
    return f"{day}{superscripts[suffix]} {date_obj.strftime('%B %Y')}"

def format_amount(amount) -> str:
    """Return string with 2 decimals if needed, else integer."""
    try:
        amount = float(amount)
        return str(int(amount)) if amount == int(amount) else f"{amount:.2f}"
    except Exception:
        return ''

def build_context(employee: Employee) -> dict:
    """Prepare context for DOCX template."""
    try:
        context = employee.to_dict()
        context.update({
            'start_date': format_date_for_docx(employee.start_date),
            'end_date': format_date_for_docx(employee.end_date),
            'employer_signature_date': format_date_for_docx(employee.employer_signature_date),
            'employee_signature_date': format_date_for_docx(employee.employee_signature_date),
            'salary_amount': format_amount(employee.salary_amount),
            'medical_allowance': format_amount(employee.medical_allowance),
            'child_education_allowance': format_amount(employee.child_education_allowance),
            'delivery_benefit': format_amount(employee.delivery_benefit),
            'delivery_benefit_miscarriage': format_amount(getattr(employee, 'delivery_benefit_miscarriage', None)),
            'death_benefit': format_amount(employee.death_benefit),
            'severance_percentage': f"{float(employee.severance_percentage):.2f}%",
        })
        return context
    except Exception as e:
        flash(f'Error building DOCX context: {e}', 'danger')
        return {}

def sanitize_filename(name: str) -> str:
    """Remove invalid filename chars and ensure non-empty."""
    name = re.sub(r'[<>:"/\\|?*]', '_', name or '')
    name = name.strip().strip('.')
    return name or 'Employee'

def generate_contract_no(contract_type: str, existing_no: str = None) -> str:
    """
    Generate contract number: NGOF-FDC/001 or NGOF-UDC/001
    If existing_no is given, preserve the numeric part.
    """
    prefix = 'NGOF'
    type_code = 'FDC' if 'FDC' in contract_type else 'UDC'
    if existing_no and (match := re.search(r'\d+$', existing_no)):
        num = match.group(0)
    else:
        num = '001'
    return f"{prefix}-{type_code}/{num}"

# ----------------------------------------------------------------------
# Routes
# ----------------------------------------------------------------------
@employees_bp.route('/')
@login_required
def index():
    try:
        search = request.args.get('search', '').strip()
        sort = request.args.get('sort', 'created_at_desc')
        per_page = max(int(request.args.get('entries', 10)), 1)
        page = max(int(request.args.get('page', 1)), 1)
        contract_type_filter = request.args.get('contract_type', '').strip()

        query = Employee.query.filter_by(deleted_at=None)

        # Search filter
        if search:
            query = query.filter(
                or_(
                    Employee.employee_name.ilike(f'%{search}%'),
                    Employee.position_title.ilike(f'%{search}%'),
                    Employee.contract_no.ilike(f'%{search}%')
                )
            )

        # Contract Type Filter
        if contract_type_filter:
            query = query.filter(Employee.contract_type == contract_type_filter)

        # Sorting
        sort_map = {
            'employee_name_asc': Employee.employee_name.asc(),
            'employee_name_desc': Employee.employee_name.desc(),
            'start_date_asc': Employee.start_date.asc(),
            'start_date_desc': Employee.start_date.desc(),
            'created_at_desc': Employee.created_at.desc(),
        }
        query = query.order_by(sort_map.get(sort, Employee.created_at.desc()))

        pagination = query.paginate(page=page, per_page=per_page, error_out=False)
        is_admin = getattr(current_user, 'has_role', lambda x: False)('Admin')

        return render_template(
            'employees/index.html',
            employees=pagination.items,
            pagination=pagination,
            search_query=search,
            sort_order=sort,
            entries_per_page=per_page,
            total_employees=query.count(),
            is_admin=is_admin,
            contract_type_filter=contract_type_filter  # Pass back to template
        )
    except Exception as e:
        flash(f'Error loading list: {e}', 'danger')
        return render_template('employees/index.html', employees=[], pagination=None)


def generate_contract_no(contract_type: str, base_no: str = None) -> str:
    """Generate a valid contract number: NGOF-FDC/001 or NGOF-UDC/001"""
    prefix = "NGOF"
    type_code = "FDC" if "FDC" in contract_type else "UDC"
    
    if base_no and re.match(r'^NGOF-(FDC|UDC)/\d+$', base_no):
        return base_no
    
    # Get next number from DB
    last = db.session.query(Employee.contract_no) \
        .filter(Employee.contract_no.like(f'{prefix}-{type_code}/%')) \
        .order_by(Employee.contract_no.desc()) \
        .first()
    
    if last:
        num = int(last[0].split('/')[-1]) + 1
    else:
        num = 1
    
    return f"{prefix}-{type_code}/{str(num).zfill(3)}"


@employees_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create():
    form_data = {}

    if request.method == 'POST':
        try:
            # === Required Fields ===
            contract_type = request.form['contract_type'].strip()
            contract_no = request.form['contract_no'].strip().upper()

            # Optional: Validate format only (not uniqueness)
            if not re.match(r'^NGOF-(FDC|UDC)/\d+$', contract_no):
                flash('Contract number must be in format: NGOF-FDC/001 or NGOF-UDC/001', 'danger')
                form_data = request.form.to_dict()
                return render_template('employees/create.html', form_data=form_data)

            start_date_str = request.form['start_date'].strip()
            if not start_date_str:
                flash('Start date is required.', 'danger')
                form_data = request.form.to_dict()
                return render_template('employees/create.html', form_data=form_data)

            start_date = datetime.strptime(start_date_str, '%Y-%m-%d').date()

            # === End Date (Only for FDC) ===
            end_date = None
            if contract_type == 'Fixed Duration Contract (FDC)':
                end_date_str = request.form.get('end_date', '').strip()
                if not end_date_str:
                    flash('End date is required for Fixed Duration Contract.', 'danger')
                    form_data = request.form.to_dict()
                    return render_template('employees/create.html', form_data=form_data)
                end_date = datetime.strptime(end_date_str, '%Y-%m-%d').date()
                if end_date < start_date:
                    flash('End date cannot be earlier than start date.', 'danger')
                    return render_template('employees/create.html', form_data=form_data)

            # === Signature Dates ===
            employer_sig_date = request.form.get('employer_signature_date', '') or start_date_str
            employee_sig_date = request.form.get('employee_signature_date', '') or start_date_str
            employer_sig_date = datetime.strptime(employer_sig_date, '%Y-%m-%d').date()
            employee_sig_date = datetime.strptime(employee_sig_date, '%Y-%m-%d').date()

            # === Create Employee ===
            emp = Employee(
                contract_no=contract_no,  # ← Can be duplicated! Allowed!
                contract_type=contract_type,
                employee_name=request.form['employee_name'].strip(),
                position_title=request.form['position_title'].strip(),
                employee_address=request.form.get('employee_address', '').strip(),
                employee_tel=request.form.get('employee_tel', '').strip(),
                employee_email=request.form.get('employee_email', '').strip(),
                start_date=start_date,
                end_date=end_date,
                working_hours=request.form.get('working_hours', '').strip() or 'Monday to Friday: 08:00am-12:00pm and 01:30pm-05:00pm',
                salary_amount=float(request.form.get('salary_amount', 0) or 0),
                salary_grade=request.form.get('salary_grade', '').strip(),
                medical_allowance=float(request.form.get('medical_allowance', 150)),
                child_education_allowance=float(request.form.get('child_education_allowance', 60)),
                delivery_benefit=float(request.form.get('delivery_benefit', 200)),
                death_benefit=float(request.form.get('death_benefit', 200)),
                severance_percentage=float(request.form.get('severance_percentage', 8.33)),
                thirteenth_month_salary='thirteenth_month_salary' in request.form,
                organization_name=request.form.get('organization_name', 'The NGO Forum on Cambodia').strip(),
                representative_name=request.form.get('representative_name', 'Mr. Soeung Saroeun').strip(),
                representative_title=request.form.get('representative_title', 'Executive Director').strip(),
                organization_address=request.form.get('organization_address', '').strip(),
                organization_tel=request.form.get('organization_tel', '').strip(),
                organization_fax=request.form.get('organization_fax', '').strip(),
                organization_email=request.form.get('organization_email', '').strip(),
                employer_signature_name=request.form.get('employer_signature_name', 'Mr. Soeung Saroeun').strip(),
                employee_signature_name=request.form.get('employee_signature_name', '').strip() or request.form['employee_name'].strip(),
                employer_signature_date=employer_sig_date,
                employee_signature_date=employee_sig_date,
            )

            emp.generate_salary_in_words()
            db.session.add(emp)
            db.session.commit()

            flash(f'Contract created → {contract_no} for {emp.employee_name}', 'success')
            return redirect(url_for('employees.index'))

        except ValueError as e:
            db.session.rollback()
            flash('Invalid date or number format.', 'danger')
        except Exception as e:
            db.session.rollback()
            flash(f'Error: {str(e)}', 'danger')

        form_data = request.form.to_dict()
        form_data['thirteenth_month_salary'] = 'thirteenth_month_salary' in request.form

    return render_template('employees/create.html', form_data=form_data)
@employees_bp.route('/api/employees/search')
@login_required
def api_search_employees():
    query = request.args.get('q', '').strip()
    if not query:
        return jsonify([])
    
    employees = Employee.query.filter(
        Employee.employee_name.ilike(f'%{query}%'),
        Employee.deleted_at.is_(None)
    ).order_by(Employee.employee_name).limit(10).all()
    
    results = []
    for emp in employees:
        results.append({
            'id': emp.id,
            'name': emp.employee_name,
            'position': emp.position_title or '',
            'address': emp.employee_address or '',
            'phone': emp.employee_tel or '',
            'email': emp.employee_email or ''
        })
    
    return jsonify(results)

@employees_bp.route('/<string:id>')
@login_required
def view(id):
    employee = Employee.query.filter_by(id=id, deleted_at=None).first_or_404()
    return render_template('employees/view.html', employee=employee)


@employees_bp.route('/update/<string:id>', methods=['GET', 'POST'])
@login_required
def update(id):
    employee = Employee.query.filter_by(id=id, deleted_at=None).first_or_404()
    form_data = {}

    if request.method == 'POST':
        try:
            contract_type = request.form['contract_type'].strip()
            start_date = datetime.strptime(request.form['start_date'], '%Y-%m-%d').date()

            # End date: Only required for FDC
            end_date = None
            if contract_type == 'Fixed Duration Contract (FDC)':
                end_date_str = request.form.get('end_date', '').strip()
                if not end_date_str:
                    flash('End date is required for Fixed Duration Contract.', 'danger')
                    form_data = request.form.to_dict()
                    return render_template('employees/update.html', employee=employee, form_data=form_data)
                end_date = datetime.strptime(end_date_str, '%Y-%m-%d').date()
                if end_date < start_date:
                    flash('End date cannot be earlier than start date.', 'danger')
                    form_data = request.form.to_dict()
                    return render_template('employees/update.html', employee=employee, form_data=form_data)

            # Signature dates
            emp_sig_date = request.form.get('employee_signature_date', '') or request.form['start_date']
            emp_sig_date = datetime.strptime(emp_sig_date, '%Y-%m-%d').date()

            employer_sig_date = request.form.get('employer_signature_date', '') or request.form['start_date']
            employer_sig_date = datetime.strptime(employer_sig_date, '%Y-%m-%d').date()

            # Update all fields
            employee.contract_no = request.form['contract_no'].strip()
            employee.contract_type = contract_type
            employee.employee_name = request.form['employee_name'].strip()
            employee.position_title = request.form['position_title'].strip()
            employee.employee_address = request.form.get('employee_address', '').strip()
            employee.employee_tel = request.form.get('employee_tel', '').strip()
            employee.employee_email = request.form.get('employee_email', '').strip()
            employee.start_date = start_date
            employee.end_date = end_date  # NULL for UDC
            employee.working_hours = request.form.get('working_hours', '').strip() or employee.working_hours
            employee.salary_amount = float(request.form.get('salary_amount', 0))
            employee.salary_grade = request.form.get('salary_grade', '').strip()
            employee.medical_allowance = float(request.form.get('medical_allowance', 150))
            employee.child_education_allowance = float(request.form.get('child_education_allowance', 60))
            employee.delivery_benefit = float(request.form.get('delivery_benefit', 200))
            employee.death_benefit = float(request.form.get('death_benefit', 200))
            employee.severance_percentage = float(request.form.get('severance_percentage', 8.33))
            employee.thirteenth_month_salary = 'thirteenth_month_salary' in request.form

            # Organization info
            employee.organization_name = request.form.get('organization_name', employee.organization_name).strip()
            employee.representative_name = request.form.get('representative_name', employee.representative_name).strip()
            employee.organization_address = request.form.get('organization_address', '').strip()
            employee.organization_tel = request.form.get('organization_tel', '').strip()
            employee.organization_email = request.form.get('organization_email', '').strip()

            # Signatures
            employee.employer_signature_name = request.form.get('employer_signature_name', employee.employer_signature_name).strip()
            employee.employee_signature_name = request.form.get('employee_signature_name', '').strip() or employee.employee_name
            employee.employer_signature_date = employer_sig_date
            employee.employee_signature_date = emp_sig_date

            # Generate salary words
            employee.generate_salary_in_words()

            db.session.commit()
            flash(f'Contract updated: {employee.contract_no} - {employee.employee_name}', 'success')
            return redirect(url_for('employees.index'))

        except Exception as e:
            db.session.rollback()
            flash(f'Error: {str(e)}', 'danger')
            form_data = request.form.to_dict()

    # GET request - load current data
    return render_template('employees/update.html', employee=employee, form_data=form_data)

@employees_bp.route('/delete/<string:id>', methods=['POST'])
@login_required
def delete(id):
    try:
        emp = Employee.query.filter_by(id=id, deleted_at=None).first_or_404()
        emp.deleted_at = datetime.utcnow()
        db.session.commit()
        flash(f'{emp.employee_name} deleted.', 'success')
    except Exception as e:
        db.session.rollback()
        flash(f'Delete failed: {e}', 'danger')
    return redirect(url_for('employees.index'))


@employees_bp.route('/download/<string:id>')
@login_required
def download_docx(id):
    employee = Employee.query.filter_by(id=id, deleted_at=None).first_or_404()

    tpl_path = os.path.join(current_app.root_path, 'static', 'templates', 'Employee_template.docx')
    if not os.path.exists(tpl_path):
        flash('DOCX template file is missing!', 'danger')
        return redirect(url_for('employees.index'))

    # Helper: Format date with ordinal (1st, 2nd, 3rd, 4th...)
    def format_date_ordinal(date_obj):
        if not date_obj:
            return "N/A"
        day = date_obj.day
        if 11 <= day % 100 <= 13:
            suffix = 'th'
        else:
            suffix = {1: 'st', 2: 'nd', 3: 'rd'}.get(day % 10, 'th')
        return date_obj.strftime(f"%d{suffix} %B %Y")

    # Build context (keep your existing build_context if you have one)
    context = build_context(employee) if 'build_context' in globals() else {}

    # Smart sentence for contract duration
    start_formatted = format_date_ordinal(employee.start_date)
    if employee.contract_type == "Undefined Duration Contract (UDC)":
        context['contract_duration_sentence'] = f"This contract will begin on {start_formatted}."
    else:
        end_formatted = format_date_ordinal(employee.end_date) if employee.end_date else "N/A"
        context['contract_duration_sentence'] = f"This contract will begin on {start_formatted} until {end_formatted}."

    # Optional: also provide clean dates
    context['start_date_formatted'] = start_formatted
    context['end_date_formatted'] = format_date_ordinal(employee.end_date) if employee.end_date else ""

    # Render document
    doc = DocxTemplate(tpl_path)
    doc.render(context)
    buffer = io.BytesIO()
    doc.save(buffer)
    buffer.seek(0)

    safe_name = sanitize_filename(employee.employee_name or "Employee")
    filename = f"{employee.contract_no}_{safe_name}.docx"

    return send_file(
        buffer,
        as_attachment=True,
        download_name=filename,
        mimetype='application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    )

@employees_bp.route('/download_all')
@login_required
def download_all_docx():
    employees = Employee.query.filter_by(deleted_at=None).all()
    if not employees:
        flash('No employee contracts to download.', 'warning')
        return redirect(url_for('employees.index'))

    tpl_path = os.path.join(current_app.root_path, 'static', 'templates', 'Employee_template.docx')
    if not os.path.exists(tpl_path):
        flash('DOCX template file is missing!', 'danger')
        return redirect(url_for('employees.index'))

    # Helper: Format date with ordinal (1st, 2nd, 3rd, 4th...)
    def format_date_ordinal(date_obj):
        if not date_obj:
            return "N/A"
        day = date_obj.day
        if 11 <= day % 100 <= 13:
            suffix = 'th'
        else:
            suffix = {1: 'st', 2: 'nd', 3: 'rd'}.get(day % 10, 'th')
        return date_obj.strftime(f"%d{suffix} %B %Y")

    # Create ZIP in memory
    zip_buffer = io.BytesIO()
    with zipfile.ZipFile(zip_buffer, 'w', zipfile.ZIP_DEFLATED) as zf:
        for emp in employees:
            # Build base context
            context = build_context(emp) if 'build_context' in globals() else {}

            # Smart duration sentence
            start_formatted = format_date_ordinal(emp.start_date)
            if emp.contract_type == "Undefined Duration Contract (UDC)":
                context['contract_duration_sentence'] = f"This contract will begin on {start_formatted}."
            else:
                end_formatted = format_date_ordinal(emp.end_date) if emp.end_date else "N/A"
                context['contract_duration_sentence'] = f"This contract will begin on {start_formatted} until {end_formatted}."

            # Optional: clean individual dates
            context['start_date_formatted'] = start_formatted
            context['end_date_formatted'] = format_date_ordinal(emp.end_date) if emp.end_date else ""

            # Render DOCX
            doc = DocxTemplate(tpl_path)
            doc.render(context)

            # Save to memory
            file_buffer = io.BytesIO()
            doc.save(file_buffer)
            file_buffer.seek(0)

            # Safe filename
            safe_name = sanitize_filename(emp.employee_name or "Employee")
            filename = f"{emp.contract_no}_{safe_name}.docx"

            # Add to ZIP
            zf.writestr(filename, file_buffer.read())

    zip_buffer.seek(0)
    return send_file(
        zip_buffer,
        as_attachment=True,
        download_name=f"All_Employee_Contracts_{datetime.now().strftime('%Y%m%d')}.zip",
        mimetype='application/zip'
    )


@employees_bp.route('/view_docx/<string:id>')
@login_required
def view_docx(id):
    employee = Employee.query.filter_by(id=id, deleted_at=None).first_or_404()

    tpl_path = os.path.join(current_app.root_path, 'static', 'templates', 'Employee_template.docx')
    if not os.path.exists(tpl_path):
        flash('DOCX template file is missing!', 'danger')
        return redirect(url_for('employees.index'))

    # Helper: Format date with ordinal (1st, 2nd, 3rd, 4th...)
    def format_date_ordinal(date_obj):
        if not date_obj:
            return "N/A"
        day = date_obj.day
        if 11 <= day % 100 <= 13:
            suffix = 'th'
        else:
            suffix = {1: 'st', 2: 'nd', 3: 'rd'}.get(day % 10, 'th')
        return date_obj.strftime(f"%d{suffix} %B %Y")

    # Build context
    context = build_context(employee) if 'build_context' in globals() else {}

    # Smart contract duration sentence (same as download!)
    start_formatted = format_date_ordinal(employee.start_date)
    if employee.contract_type == "Undefined Duration Contract (UDC)":
        context['contract_duration_sentence'] = f"This contract will begin on {start_formatted}."
    else:
        end_formatted = format_date_ordinal(employee.end_date) if employee.end_date else "N/A"
        context['contract_duration_sentence'] = f"This contract will begin on {start_formatted} until {end_formatted}."

    context['start_date_formatted'] = start_formatted
    context['end_date_formatted'] = format_date_ordinal(employee.end_date) if employee.end_date else ""

    # Render DOCX to memory
    doc = DocxTemplate(tpl_path)
    doc.render(context)
    buffer = io.BytesIO()
    doc.save(buffer)
    buffer.seek(0)

    # Convert to HTML using mammoth (preserves formatting!)
    try:
        result = mammoth.convert_to_html(buffer)
        html = result.value
        messages = result.messages  # Optional: show warnings if needed
    except Exception as e:
        flash(f'Failed to generate preview: {str(e)}', 'danger')
        return redirect(url_for('employees.index'))

    return render_template(
        'employees/view_docx.html',
        html_content=Markup(html),
        employee=employee
    )