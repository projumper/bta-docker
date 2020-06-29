#!bin/bash

sudo apt-get update
sudo apt upgrade -y
sudo DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
sudo apt-get install -y php7.2

sudo apt install -y mysql-server apache2

sudo apt-get install -y mysql-client
sudo apt-get install -y php-pdo-mysql

apt install -y libapache2-mod-php php-cli
sudo apt install -y composer nodejs npm chromium-browser default-jre-headless git
sudo apt install -y php-gd php-intl php-iconv php-mbstring php-mysql php-xml php-zip php-json

/etc/init.d/mysql start 

sudo mkdir /var/www/sw6
cd /var/www/sw6
sudo wget https://www.shopware.com/de/Download/redirect/version/sw6/file/install_6.2.2_1592398977.zip
sudo apt install unzip
sudo unzip install_6.2.2_1592398977.zip 

#docroot anpassen

sudo chmod -R 777 var/ public/ config/ /var/www/sw6/
sudo apt-get install php-intl php-xml php-zip php-apcu php-mbstring php-json php-gd unzip nodejs openssh-server git php-curl curl npm
sudo npm install -g npm@latest

sudo a2enmod rewrite
