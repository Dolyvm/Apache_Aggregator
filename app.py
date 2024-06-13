from flask import Flask, request, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import and_

app = Flask(__name__)
app.config.from_object('config.Config')
db = SQLAlchemy(app)

class AccessLog(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    ip_address = db.Column(db.String(50))
    date = db.Column(db.DateTime)
    request = db.Column(db.String(200))
    status = db.Column(db.Integer)
    size = db.Column(db.Integer)

@app.route('/')
def home():
    return "Добро пожаловать на Apache Logs Aggregator API. Используйте /logs чтобы просмотреть логи."

@app.route('/favicon.ico')
def favicon():
    return '', 204

@app.route('/logs', methods=['GET'])
def get_logs():
    logs = AccessLog.query.all()
    return render_template('logs.html', logs=logs)

@app.route('/logs/filter', methods=['GET'])
def filter_logs():
    start_date = request.args.get('start_date')
    end_date = request.args.get('end_date')
    ip_address = request.args.get('ip_address')
    request_type = request.args.get('request_type')

    query = AccessLog.query

    if start_date and end_date:
        query = query.filter(AccessLog.date.between(start_date, end_date))

    if ip_address:
        query = query.filter_by(ip_address=ip_address)

    if request_type:
        query = query.filter(AccessLog.request.contains(request_type))

    filtered_logs = query.all()

    return render_template('logs.html', logs=filtered_logs)

if __name__ == "__main__":
    with app.app_context():
        db.create_all()
    app.run(debug=True)