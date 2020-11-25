FROM python:3.8-slim

WORKDIR /app

RUN apt update && \
    apt install -y build-essential libev-dev libffi-dev && \
    apt clean && \
    pip3 install --upgrade pip

COPY requirements.txt /app
RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT ["python3"]
CMD ["server.py"]
