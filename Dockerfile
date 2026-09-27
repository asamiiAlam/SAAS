FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

COPY ./src .

EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate && gunicorn cfehome.wsgi:application --bind 0.0.0.0:8000"]