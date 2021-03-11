#!bin/bash
sudo apt-get update
sudo apt upgrade -y
sudo DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
sudo apt-get install -y php7.4
sudo apt-get install -y mysql-client
sudo apt-get install -y php-pdo-mysql
sudo apt install -y mysql-server apache2
sudo apt install -y composer nodejs npm chromium-browser default-jre-headless git
sudo apt install -y php-gd php-intl php-iconv php-mbstring php-mysql php-xml php-zip php-json
sudo apt-get update
sudo apt-get install php-intl php-xml php-zip php-apcu php-mbstring php-json php-gd unzip nodejs openssh-server git php-curl curl
