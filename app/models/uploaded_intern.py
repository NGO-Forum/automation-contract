# app/models/uploaded_intern.py
from datetime import datetime
from .. import db


class UploadedIntern(db.Model):
    __tablename__ = 'uploaded_intern'
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)
    filename = db.Column(db.String(255), nullable=False)
    original_name = db.Column(db.String(255), nullable=False)
    uploaded_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False, index=True)
    uploaded_by = db.Column(db.String(120), nullable=False)  # username

    def to_dict(self):
        return {
            'id': self.id,
            'filename': self.filename,
            'original_name': self.original_name,
            'uploaded_at': self.uploaded_at.isoformat() if self.uploaded_at else None,
            'uploaded_by': self.uploaded_by
        }

    def __repr__(self):
        return f"<UploadedIntern {self.id}: {self.original_name} by {self.uploaded_by}>"