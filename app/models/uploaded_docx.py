# app/models/uploaded_docx.py
from datetime import datetime
from .. import db


class UploadedDocx(db.Model):
    __tablename__ = 'uploaded_docx'
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)
    filename = db.Column(db.String(255), nullable=False)          # stored file name (e.g. mydoc_1.docx)
    original_name = db.Column(db.String(255), nullable=False)     # name shown to user
    uploaded_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False, index=True)

    # ---- NEW: plain text field (no FK) ----
    uploaded_by = db.Column(db.String(120), nullable=False)       # username, e.g. "john_doe"

    # ------------------------------------------------------------------
    # Helper – used in templates / API
    # ------------------------------------------------------------------
    def to_dict(self):
        return {
            'id': self.id,
            'filename': self.filename,
            'original_name': self.original_name,
            'uploaded_at': self.uploaded_at.isoformat() if self.uploaded_at else None,
            'uploaded_by': self.uploaded_by
        }

    def __repr__(self):
        return f"<UploadedDocx {self.id}: {self.original_name} by {self.uploaded_by}>"