# app/routes/docx_upload.py
import os
from pathlib import Path
from datetime import date
from flask import (
    Blueprint, render_template, request, flash,
    redirect, url_for, send_from_directory, current_app
)
from flask_login import login_required, current_user
from werkzeug.utils import secure_filename
from sqlalchemy import func
from ..models.uploaded_docx import UploadedDocx
from .. import db

docx_upload_bp = Blueprint('docx_upload', __name__, url_prefix='/contracts')

ALLOWED_EXT = {'docx'}
UPLOAD_SUBDIR = Path('static') / 'uploads' / 'docx'


def allowed_file(filename: str) -> bool:
    """Check if file has allowed extension."""
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXT


# ----------------------------------------------------------------------
# LIST PAGE + STATS
# ----------------------------------------------------------------------
@docx_upload_bp.route('/uploads')
@login_required
def uploads_list():
    page = request.args.get('page', 1, type=int)
    per_page = 15

    # Pagination
    pagination = (
        UploadedDocx.query
        .order_by(UploadedDocx.uploaded_at.desc())
        .paginate(page=page, per_page=per_page, error_out=False)
    )

    # Stats for cards
    total_uploads = UploadedDocx.query.count()
    today = date.today()
    today_uploads = UploadedDocx.query.filter(
        func.date(UploadedDocx.uploaded_at) == today
    ).count()

    return render_template(
        'contracts/uploads.html',
        pagination=pagination,
        total_uploads=total_uploads,
        today_uploads=today_uploads,
        today_date=today.strftime('%b %d, %Y')
    )


# ----------------------------------------------------------------------
# UPLOAD (POST)
# ----------------------------------------------------------------------
@docx_upload_bp.route('/upload', methods=['POST'])
@login_required
def upload_file():
    if 'files' not in request.files:
        flash('No file part', 'danger')
        return redirect(request.referrer or url_for('docx_upload.uploads_list'))

    files = request.files.getlist('files')
    if not files or all(f.filename == '' for f in files):
        flash('No files selected', 'warning')
        return redirect(request.referrer or url_for('docx_upload.uploads_list'))

    # Ensure upload directory exists
    upload_dir = Path(current_app.root_path) / UPLOAD_SUBDIR
    upload_dir.mkdir(parents=True, exist_ok=True)

    saved = 0
    for file in files:
        if file.filename == '':
            continue
        if not allowed_file(file.filename):
            flash(f'Invalid file: {file.filename} – only .docx allowed', 'warning')
            continue

        original = secure_filename(file.filename)
        base, ext = os.path.splitext(original)
        counter = 1
        filename = original

        # Avoid name collision
        while (upload_dir / filename).exists():
            filename = f"{base}_{counter}{ext}"
            counter += 1

        filepath = upload_dir / filename
        file.save(filepath)

        # Save to DB – use username, not ID
        doc = UploadedDocx(
            filename=filename,
            original_name=original,
            uploaded_by=current_user.username  # ← FIXED: string, no FK
        )
        db.session.add(doc)
        saved += 1

    db.session.commit()
    flash(f'{saved} file(s) uploaded successfully', 'success')
    return redirect(url_for('docx_upload.uploads_list'))


# ----------------------------------------------------------------------
# DOWNLOAD
# ----------------------------------------------------------------------
@docx_upload_bp.route('/download/<int:file_id>')
@login_required
def download(file_id):
    doc = UploadedDocx.query.get_or_404(file_id)
    file_path = Path(current_app.root_path) / UPLOAD_SUBDIR / doc.filename

    if not file_path.exists():
        flash('File not found on server', 'danger')
        return redirect(url_for('docx_upload.uploads_list'))

    return send_from_directory(
        directory=file_path.parent,
        path=file_path.name,
        as_attachment=True,
        download_name=doc.original_name
    )


# ----------------------------------------------------------------------
# DELETE (admin only)
# ----------------------------------------------------------------------
@docx_upload_bp.route('/delete/<int:file_id>', methods=['POST'])
@login_required
def delete(file_id):
    if not current_user.has_role('Admin'):
        flash('Permission denied', 'danger')
        return redirect(url_for('docx_upload.uploads_list'))

    doc = UploadedDocx.query.get_or_404(file_id)
    file_path = Path(current_app.root_path) / UPLOAD_SUBDIR / doc.filename

    # Delete file
    try:
        if file_path.exists():
            file_path.unlink()
    except Exception as e:
        current_app.logger.error(f"Failed to delete file {file_path}: {e}")

    # Delete DB record
    db.session.delete(doc)
    db.session.commit()

    flash(f'File "{doc.original_name}" deleted', 'info')
    return redirect(url_for('docx_upload.uploads_list'))