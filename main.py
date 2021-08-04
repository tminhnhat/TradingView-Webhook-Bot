# ----------------------------------------------- #
# Plugin Name           : TradingView-Webhook-Bot #
# Author Name           : fabston                 #
# File Name             : main.py                 #
# ----------------------------------------------- #

import json
import time

from flask import Flask, request

import config
from handler import *

app = Flask(__name__)


def get_timestamp():
    timestamp = time.strftime("%Y-%m-%d %X")
    return timestamp


@app.route("/webhook2", methods=["POST"])
def webhook2():
    try:
        if request.method == "POST":
            data = request.get_json()
            key2 = data["key"]
            if key2 == config.sec_key2:
                print(get_timestamp(), "Alert Received & Sent!")
                delay(3)
                send_alert(data)
                return "Sent alert", 200

            else:
                print("[X]", get_timestamp(), "Alert Received & Refused! (Wrong Key)")
                return "Refused alert", 400

    except Exception as e:
        print("[X]", get_timestamp(), "Error:\n>", e)
        return "Error", 400


if __name__ == "__main__":
    from waitress import serve

    serve(app, host="0.0.0.0", port=80)
