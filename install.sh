#/bin/bash


echo "Bat dau cai bot tradingview" 

echo "Updating package manager..."
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
sudo -E apt-get -qy update >> /tmp/install.log 2>&1

echo "chuyen qua root"
sudo su >> /tmp/install.log 2>&1

echo "Tai code tu github ve"
sudo git clone https://github.com/tminhnhat/TradingView-Webhook-Bot.git >> /tmp/install.log 2>&1

echo "tao virtual environment"
sudo python3 -m venv TradingView-Webhook-Bot >> /tmp/install.log 2>&1
sudo source TradingView-Webhook-Bot/bin/activate && cd TradingView-Webhook-Bot >> /tmp/install.log 2>&1

echo "Cai requirements" 
pip install -r requirements.txt
echo "cai xong roi, edit file config, cai thong so roi chay lenh python main.py de chay"





