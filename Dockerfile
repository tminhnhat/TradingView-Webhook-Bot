FROM python:3.9-alpine
FROM node:12
LABEL Auther="tibishop"
RUN mkdir -p /usr/src/app
RUN sudo apt-get update -y && apt-get install -y sudo jq wget sqlite3 git openssh-server python3-venv
RUN cd /usr/src/app && git clone https://github.com/tminhnhat/TradingView-Webhook-Bot.git
RUN sudo su
RUN sudo python3 -m venv TradingView-Webhook-Bot
RUN sudo source TradingView-Webhook-Bot/bin/activate && cd TradingView-Webhook-Bot
WORKDIR /usr/src/app/TradingView-Webhook-Bot
COPY requirements.txt ./
RUN apk add gcc python3-dev openssl-dev musl-dev libffi-dev &&\
    pip install --no-cache-dir -r requirements.txt

COPY main.py handler.py config.py ./
EXPOSE 80

ENTRYPOINT [ "python", "main.py" ]
