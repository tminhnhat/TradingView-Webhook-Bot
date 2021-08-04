FROM python:3.9-alpine
LABEL Auther="tibishop"
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
