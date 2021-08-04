FROM python:3.9-alpine
LABEL Auther="tibishop"
cd /usr/src/app && git clone https://github.com/tminhnhat/TradingView-Webhook-Bot.git
sudo su
sudo python3 -m venv TradingView-Webhook-Bot
sudo source TradingView-Webhook-Bot/bin/activate && cd TradingView-Webhook-Bot
WORKDIR /usr/src/app/TradingView-Webhook-Bot
COPY requirements.txt ./
RUN apk add gcc python3-dev openssl-dev musl-dev libffi-dev &&\
    pip install --no-cache-dir -r requirements.txt

COPY main.py handler.py config.py ./
EXPOSE 80

ENTRYPOINT [ "python", "main.py" ]
