import os


class Config:
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'postgresql://gentelman:your_password@localhost:5432/postgres')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
     #Поменять на свои пути
    LOG_DIR = os.getenv('LOG_DIR', 'Apache24/logs')
    LOG_MASK = os.getenv('LOG_MASK', 'access.log*')
