# routes/employees.py
from flask import (
    Blueprint, render_template, request, redirect, url_for,
    flash, send_file, current_app
)
from flask_login import login_required, current_user
from app import db
from app.models.employees import Employee
from datetime import datetime, date
from dateutil.relativedelta import relativedelta
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

def calculate_duration_months(start: date, end: date) -> int:
    """Return total months between start and end (inclusive of partial months)."""
    delta = relativedelta(end, start)
    return delta.years * 12 + delta.months

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

        query = Employee.query.filter_by(deleted_at=None)
        if search:
            query = query.filter(
                or_(
                    Employee.employee_name.ilike(f'%{search}%'),
                    Employee.position_title.ilike(f'%{search}%')
                )
            )

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
            is_admin=is_admin
        )
    except Exception as e:
        flash(f'Error loading list: {e}', 'danger')
        return render_template('employees/index.html', employees=[], pagination=None)


@employees_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create():
    form_data = {}
    if request.method == 'POST':
        try:
            # --- Contract basics ---
            contract_type = request.form['contract_type'].strip()
            contract_no = request.form['contract_no'].strip()
            # Auto-generate if empty or doesn't match expected pattern
            if not contract_no or not re.match(r'^NGOF-(FDC|UDC)/\d+$', contract_no):
                contract_no = generate_contract_no(contract_type)

            start_date = datetime.strptime(request.form['start_date'], '%Y-%m-%d').date()
            duration_months = int(request.form['duration_months'])
            end_date = start_date + relativedelta(months=duration_months)

            # --- Create employee ---
            emp = Employee(
                contract_no=contract_no,
                contract_type=contract_type,
                employee_name=request.form['employee_name'].strip(),
                employee_address=request.form['employee_address'].strip(),
                employee_tel=request.form['employee_tel'].strip(),
                employee_email=request.form['employee_email'].strip(),
                position_title=request.form['position_title'].strip(),
                start_date=start_date,
                end_date=end_date,
                working_hours=request.form['working_hours'].strip(),
                salary_amount=float(request.form.get('salary_amount', 0.0)),
                salary_grade=request.form['salary_grade'].strip(),
                medical_allowance=float(request.form.get('medical_allowance', 150.00)),
                child_education_allowance=float(request.form.get('child_education_allowance', 60.00)),
                delivery_benefit=float(request.form.get('delivery_benefit', 200.00)),
                delivery_benefit_miscarriage=float(request.form.get('delivery_benefit_miscarriage', 200.00)),
                death_benefit=float(request.form.get('death_benefit', 200.00)),
                severance_percentage=float(request.form.get('severance_percentage', 8.33)),
                thirteenth_month_salary='thirteenth_month_salary' in request.form,
                organization_name=request.form['organization_name'].strip(),
                representative_name=request.form['representative_name'].strip(),
                representative_title=request.form.get('representative_title', 'Executive Director').strip(),
                organization_address=request.form['organization_address'].strip(),
                organization_tel=request.form['organization_tel'].strip(),
                organization_fax=request.form['organization_fax'].strip(),
                organization_email=request.form['organization_email'].strip(),
                employer_signature_name=request.form['employer_signature_name'].strip(),
                employee_signature_name=request.form['employee_signature_name'].strip(),
                employer_signature_date=start_date,
                employee_signature_date=start_date
            )

            # Generate salary in words
            emp.generate_salary_in_words()

            # Validate client-provided words
            client_words = request.form.get('salary_amount_words', '').strip()
            if client_words and client_words != emp.salary_amount_words:
                flash('Client salary in words mismatched. Using server value.', 'warning')

            db.session.add(emp)
            db.session.commit()
            flash('Employee created successfully!', 'success')
            return redirect(url_for('employees.index'))

        except ValueError as ve:
            db.session.rollback()
            flash(f'Invalid input: {ve}', 'danger')
        except Exception as e:
            db.session.rollback()
            flash(f'Error: {e}', 'danger')

        form_data = request.form.to_dict()
        form_data['thirteenth_month_salary'] = 'thirteenth_month_salary' in request.form

    return render_template('employees/create.html', form_data=form_data)


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
            # --- Dates ---
            start_date = datetime.strptime(request.form['start_date'], '%Y-%m-%d').date()
            duration_months = int(request.form['duration_months'])
            end_date = start_date + relativedelta(months=duration_months)

            # --- Contract number (auto-update if type changed) ---
            new_type = request.form['contract_type'].strip()
            current_no = request.form['contract_no'].strip()
            expected_no = generate_contract_no(new_type, current_no)
            contract_no = current_no if current_no == expected_no else expected_no

            # --- Update fields ---
            fields = [
                'contract_no', 'contract_type', 'employee_name', 'employee_address',
                'employee_tel', 'employee_email', 'position_title', 'working_hours',
                'salary_grade', 'organization_name', 'representative_name',
                'representative_title', 'organization_address', 'organization_tel',
                'organization_fax', 'organization_email', 'employer_signature_name',
                'employee_signature_name'
            ]
            for f in fields:
                setattr(employee, f, request.form.get(f, '').strip())

            # Numeric
            employee.salary_amount = float(request.form.get('salary_amount', 0.0))
            employee.medical_allowance = float(request.form.get('medical_allowance', 150.00))
            employee.child_education_allowance = float(request.form.get('child_education_allowance', 60.00))
            employee.delivery_benefit = float(request.form.get('delivery_benefit', 200.00))
            employee.delivery_benefit_miscarriage = float(request.form.get('delivery_benefit_miscarriage', 200.00))
            employee.death_benefit = float(request.form.get('death_benefit', 200.00))
            employee.severance_percentage = float(request.form.get('severance_percentage', 8.33))
            employee.thirteenth_month_salary = 'thirteenth_month_salary' in request.form

            # Dates
            employee.start_date = start_date
            employee.end_date = end_date
            employee.employer_signature_date = start_date
            employee.employee_signature_date = start_date

            # Salary words
            employee.generate_salary_in_words()
            if request.form.get('salary_amount_words', '').strip() != employee.salary_amount_words:
                flash('Salary in words corrected to match amount.', 'info')

            db.session.commit()
            flash('Employee updated successfully!', 'success')
            return redirect(url_for('employees.index'))

        except ValueError as ve:
            db.session.rollback()
            flash(f'Invalid input: {ve}', 'danger')
        except Exception as e:
            db.session.rollback()
            flash(f'Update failed: {e}', 'danger')

        form_data = request.form.to_dict()
        form_data['thirteenth_month_salary'] = 'thirteenth_month_salary' in request.form

    else:
        form_data = employee.to_dict()
        if employee.start_date and employee.end_date:
            form_data['duration_months'] = calculate_duration_months(employee.start_date, employee.end_date)
        else:
            form_data['duration_months'] = 12
        form_data['thirteenth_month_salary'] = employee.thirteenth_month_salary

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
        flash('DOCX template missing.', 'danger')
        return redirect(url_for('employees.index'))

    doc = DocxTemplate(tpl_path)
    doc.render(build_context(employee))
    buffer = io.BytesIO()
    doc.save(buffer)
    buffer.seek(0)

    filename = f"{employee.contract_no}_{sanitize_filename(employee.employee_name)}.docx"
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
        flash('No records to download.', 'warning')
        return redirect(url_for('employees.index'))

    tpl_path = os.path.join(current_app.root_path, 'static', 'templates', 'Employee_template.docx')
    if not os.path.exists(tpl_path):
        flash('DOCX template missing.', 'danger')
        return redirect(url_for('employees.index'))

    zip_buffer = io.BytesIO()
    with zipfile.ZipFile(zip_buffer, 'w', zipfile.ZIP_DEFLATED) as zf:
        for emp in employees:
            doc = DocxTemplate(tpl_path)
            doc.render(build_context(emp))
            file_buf = io.BytesIO()
            doc.save(file_buf)
            file_buf.seek(0)
            name = f"{emp.contract_no}_{sanitize_filename(emp.employee_name)}.docx"
            zf.writestr(name, file_buf.read())

    zip_buffer.seek(0)
    return send_file(
        zip_buffer,
        as_attachment=True,
        download_name=f"All_Contracts_{date.today():%Y%m%d}.zip",
        mimetype='application/zip'
    )


@employees_bp.route('/view_docx/<string:id>')
@login_required
def view_docx(id):
    employee = Employee.query.filter_by(id=id, deleted_at=None).first_or_404()
    tpl_path = os.path.join(current_app.root_path, 'static', 'templates', 'Employee_template.docx')
    if not os.path.exists(tpl_path):
        flash('Template missing.', 'danger')
        return redirect(url_for('employees.index'))

    doc = DocxTemplate(tpl_path)
    doc.render(build_context(employee))
    buffer = io.BytesIO()
    doc.save(buffer)
    buffer.seek(0)

    try:
        result = mammoth.convert_to_html(buffer)
        html = result.value
    except Exception as e:
        flash(f'Preview failed: {e}', 'danger')
        return redirect(url_for('employees.index'))

    return render_template('employees/view_docx.html', html_content=Markup(html), employee=employee)