# Apache_Aggregator
Для начала работы выполните следующие шаги:

#Установка зависимостей


Убедитесь, что у вас установлен Python версии 3.x. и установите необходимые зависимости из файла requirements.txt.

#Настройка базы данных PostgreSQL


Установите PostgreSQL, создайте базу данных и пользователя. Обновите config.py с вашими данными для подключения к PostgreSQL.

#Запуск приложения


Перейдите в корневую директорию проекта и запустите приложение с помощью команды python app.py, затем(или до этого) запустите файл parser.py. Приложение будет доступно по адресу http://127.0.0.1:5000/ в вашем браузере.

#Использование


Просмотр данных веб-интерфейсом: Откройте веб-браузер и перейдите по адресу http://127.0.0.1:5000/. Здесь вы увидите все доступные логи и форму для фильтрации по дате, IP-адресу и типу запроса.

#Фильтрация данных

Заполните поля формы на странице /logs и нажмите кнопку "Filter Logs". После отправки формы вы увидите отфильтрованные логи в таблице под формой.

#API доступа к данным

 Для получения данных в формате JSON используйте API на адресе http://127.0.0.1:5000/api/logs. Добавляйте параметры запроса для фильтрации, например:

http://127.0.0.1:5000/api/logs?start_date=2024-06-13&end_date=2024-06-14
http://127.0.0.1:5000/api/logs?ip_address=192.168.0.1
http://127.0.0.1:5000/api/logs?request_type=GET

That's All Folks
