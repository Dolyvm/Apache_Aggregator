import re
from datetime import datetime
from app import db, AccessLog, app
from config import Config

def parse_log_line(line):
    log_pattern = re.compile(r'(\S+) - - \[(.*?)\] "(.*?)" (\d+) (\S+)')
    match = log_pattern.match(line)
    if match:
        ip_address, date_str, request, status, size = match.groups()
        date = datetime.strptime(date_str.split()[0], '%d/%b/%Y:%H:%M:%S')
        size = int(size) if size != '-' else 0
        return AccessLog(ip_address=ip_address, date=date, request=request, status=int(status), size=size)
    return None

def parse_logs():
    log_dir = Config.LOG_DIR
    log_mask = Config.LOG_MASK

    import glob
    log_files = glob.glob(f"{Config.LOG_DIR}/{Config.LOG_MASK}")
    print(f"Found log files: {log_files}")

    for log_file in log_files:
        print(f"Processing log file: {log_file}")
        with open(log_file) as file:
            for line in file:
                print(f"Processing line: {line}")
                log_entry = parse_log_line(line)
                if log_entry:
                    db.session.add(log_entry)
                    print(f"Added log entry: {log_entry}")
        db.session.commit()
        print(f"Committed logs from file: {log_file}")

if __name__ == "__main__":
    with app.app_context():
        parse_logs()