FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . /opt/app
WORKDIR /opt/app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN useradd -ms /bin/bash thisorthat
USER thisorthat

WORKDIR /opt/app/src
CMD gunicorn --bind 0.0.0.0:$PORT wsgi
