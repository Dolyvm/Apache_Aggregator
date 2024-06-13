from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class AccessLog(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    ip_address = db.Column(db.String(50))
    date = db.Column(db.DateTime)
    request = db.Column(db.String(200))
    status = db.Column(db.Integer)
    size = db.Column(db.Integer)