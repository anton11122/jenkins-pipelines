FROM python:3.10

WORKDIR /app

COPY . .

RUN pip3 install --no-cache-dir -r app/requirements.txt

ENV FLASK_APP=app

EXPOSE 8080

CMD ["python", "app/main.py"]