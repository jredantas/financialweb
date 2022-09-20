FROM python:3.10.7-alpine3.16

ARG srcDir=src
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY $srcDir/* .

EXPOSE 8080

CMD ["python", "financialweb.py"]
