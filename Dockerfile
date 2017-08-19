FROM ubuntu:latest
ENV LANG_TOOL_VERSION 3.8
ADD https://www.languagetool.org/download/LanguageTool-$LANG_TOOL_VERSION.zip /LanguageTool-$LANG_TOOL_VERSION.zip

RUN apt-get update -yq && \
    apt-get install -yq python3-pip python3-dev build-essential curl unzip openjdk-8-jre-headless && \
    unzip /LanguageTool-$LANG_TOOL_VERSION.zip && \
    rm /LanguageTool-$LANG_TOOL_VERSION.zip

COPY . /opt/app
WORKDIR /opt/app
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN useradd -ms /bin/bash thisorthat
USER thisorthat

WORKDIR /opt/app/src
CMD gunicorn --bind 0.0.0.0:$PORT wsgi
