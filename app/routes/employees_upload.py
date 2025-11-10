import os
import zipfile
from io import BytesIO
from pathlib import Path
from datetime import date
from flask import (
    Blueprint, render_template, request, flash,
    redirect, url_for, send_from_directory, current_app,
    send_file, Response
)
from flask_login import login_required, current_user
from werkzeug.utils import secure_filename
from sqlalchemy import func, or_
from ..models.uploaded_employee import UploadedEmployee
from .. import db

employees_upload_bp = Blueprint('employees_upload', __name__, url_prefix='/employees')

ALLOWED_EXT = {'docx'}
UPLOAD_SUBDIR = Path('static') / 'uploads' / 'employees'


def allowed_file(filename: str) -> bool:
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXT


# ----------------------------------------------------------------------
# LIST + CARDS + FILTERS
# ----------------------------------------------------------------------
@employees_upload_bp.route('/uploads')
@login_required
def uploads_list():
    search_query = request.args.get('search', '').strip()
    sort_order   = request.args.get('sort', 'uploaded_at_desc')
    entries      = request.args.get('entries', type=int, default=15)
    page         = request.args.get('page', 1, type=int)

    query = UploadedEmployee.query

    if search_query:
        like_term = f"%{search_query}%"
        query = query.filter(
            or_(
                UploadedEmployee.original_name.ilike(like_term),
                UploadedEmployee.uploaded_by.ilike(like_term)
            )
        )

    if sort_order == 'uploaded_at_desc':
        query = query.order_by(UploadedEmployee.uploaded_at.desc())
    elif sort_order == 'uploaded_at_asc':
        query = query.order_by(UploadedEmployee.uploaded_at.asc())
    elif sort_order == 'original_name_asc':
        query = query.order_by(UploadedEmployee.original_name.asc())
    elif sort_order == 'original_name_desc':
        query = query.order_by(UploadedEmployee.original_name.desc())
    elif sort_order == 'uploaded_by_asc':
        query = query.order_by(UploadedEmployee.uploaded_by.asc())
    elif sort_order == 'uploaded_by_desc':
        query = query.order_by(UploadedEmployee.uploaded_by.desc())
    else:
        query = query.order_by(UploadedEmployee.uploaded_at.desc())

    pagination = query.paginate(page=page, per_page=entries, error_out=False)

    total_uploads = UploadedEmployee.query.count()
    today = date.today()
    today_uploads = UploadedEmployee.query.filter(
        func.date(UploadedEmployee.uploaded_at) == today
    ).count()
    today_pretty = today.strftime('%d %B %Y')

    return render_template(
        'employees/uploads.html',
        pagination=pagination,
        total_uploads=total_uploads,
        today_uploads=today_uploads,
        today_pretty=today_pretty,
        search_query=search_query,
        sort_order=sort_order,
        entries_per_page=entries,
    )


# ----------------------------------------------------------------------
# UPLOAD
# ----------------------------------------------------------------------
@employees_upload_bp.route('/upload', methods=['POST'])
@login_required
def upload_file():
    if 'files' not in request.files:
        flash('No file part', 'danger')
        return redirect(request.referrer or url_for('employees_upload.uploads_list'))

    files = request.files.getlist('files')
    if not files or all(f.filename == '' for f in files):
        flash('No files selected', 'warning')
        return redirect(request.referrer or url_for('employees_upload.uploads_list'))

    upload_dir = Path(current_app.root_path) / UPLOAD_SUBDIR
    upload_dir.mkdir(parents=True, exist_ok=True)

    saved = 0
    for file in files:
        if not file.filename:
            continue
        if not allowed_file(file.filename):
            flash(f'Invalid: {file.filename} – only .docx', 'warning')
            continue

        original = secure_filename(file.filename)
        base, ext = os.path.splitext(original)
        counter = 1
        filename = original
        while (upload_dir / filename).exists():
            filename = f"{base}_{counter}{ext}"
            counter += 1

        filepath = upload_dir / filename
        file.save(filepath)

        doc = UploadedEmployee(
            filename=filename,
            original_name=original,
            uploaded_by=current_user.username
        )
        db.session.add(doc)
        saved += 1

    if saved:
        db.session.commit()
        flash(f'{saved} employee file(s) uploaded', 'success')
    else:
        flash('No valid files uploaded', 'warning')

    return redirect(url_for('employees_upload.uploads_list'))


# ----------------------------------------------------------------------
# DOWNLOAD SINGLE
# ----------------------------------------------------------------------
@employees_upload_bp.route('/download/<int:file_id>')
@login_required
def download(file_id):
    doc = UploadedEmployee.query.get_or_404(file_id)
    file_path = Path(current_app.root_path) / UPLOAD_SUBDIR / doc.filename
    if not file_path.exists():
        flash('File not found', 'danger')
        return redirect(url_for('employees_upload.uploads_list'))

    return send_from_directory(
        directory=file_path.parent,
        path=file_path.name,
        as_attachment=True,
        download_name=doc.original_name
    )


# ----------------------------------------------------------------------
# DOWNLOAD ALL AS ZIP
# ----------------------------------------------------------------------
@employees_upload_bp.route('/download-all-zip')
@login_required
def download_all_zip():
    # Get all uploaded files
    docs = UploadedEmployee.query.all()
    if not docs:
        flash('No files to download', 'info')
        return redirect(url_for('employees_upload.uploads_list'))

    memory_file = BytesIO()
    with zipfile.ZipFile(memory_file, 'w', zipfile.ZIP_DEFLATED) as zf:
        upload_dir = Path(current_app.root_path) / UPLOAD_SUBDIR
        for doc in docs:
            file_path = upload_dir / doc.filename
            if file_path.exists():
                zf.write(file_path, arcname=doc.original_name)

    memory_file.seek(0)
    today_str = date.today().strftime('%Y%m%d')
    zip_filename = f"employee_docx.zip"

    return send_file(
        memory_file,
        mimetype='application/zip',
        as_attachment=True,
        download_name=zip_filename
    )


# ----------------------------------------------------------------------
# DELETE (Admin only)
# ----------------------------------------------------------------------
@employees_upload_bp.route('/delete/<int:file_id>', methods=['POST'])
@login_required
def delete(file_id):
    if not current_user.has_role('Admin'):
        flash('Permission denied', 'danger')
        return redirect(url_for('employees_upload.uploads_list'))

    doc = UploadedEmployee.query.get_or_404(file_id)
    file_path = Path(current_app.root_path) / UPLOAD_SUBDIR / doc.filename
    try:
        if file_path.exists():
            file_path.unlink()
    except Exception as e:
        current_app.logger.error(f"Delete failed: {e}")

    db.session.delete(doc)
    db.session.commit()
    flash(f'File "{doc.original_name}" deleted', 'info')
    return redirect(url_for('employees_upload.uploads_list'))