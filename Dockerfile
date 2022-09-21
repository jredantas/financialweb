FROM python:3.9-slim

ARG srcDir=src
WORKDIR /app
COPY requirements.txt .

RUN apt update && apt upgrade
RUN apt install make gcc g++ python3-dev -y

RUN pip install --no-cache-dir -r requirements.txt

COPY $srcDir/* .

EXPOSE 8080

CMD ["python", "financialweb.py"]
