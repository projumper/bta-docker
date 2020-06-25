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

/etc/init.d/mysql start 

sudo mkdir /var/www/sw6
cd /var/www/sw6


sudo git clone https://github.com/shopware/development.git

sudo apt-get update
sudo apt-get install php-intl php-xml php-zip php-apcu php-mbstring php-json php-gd unzip nodejs openssh-server git php-curl curl npm
sudo npm install -g npm@latest


set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt install -y php7.2 libapache2-mod-php php-cli
apt install -y mysql-server apache2
apt install -y composer nodejs npm chromium-browser default-jre-headless git
apt install -y php-gd php-intl php-iconv php-mbstring php-mysql php-xml php-zip php-json
 
/etc/init.d/mysql start 

mysql << EndOfMessage
CREATE USER 'app'@'localhost' IDENTIFIED BY 'app';
GRANT ALL PRIVILEGES ON shopware.* TO 'app'@'localhost';
GRANT ALL PRIVILEGES ON shopware_test.* TO 'app'@'localhost';
GRANT ALL PRIVILEGES ON shopware_e2e.* TO 'app'@'localhost';
FLUSH PRIVILEGES;
EndOfMessage

git clone https://github.com/shopware/development.git $HOME/shopware-dev
cd $HOME/shopware-dev

##todo: entspricht nicht manuellem setup
tee .psh.yaml.override << EndOfMessage
const:
  APP_ENV: "dev"
  APP_URL: "http://shopware.test:8000";
  DB_HOST: "localhost"
  DB_PORT: "3306"
  DB_NAME: "shopware"
  DB_USER: "app"
  DB_PASSWORD: "app"
  CHROME_BIN: "chromium-browser"
EndOfMessage

git clone --depth=1 https://github.com/shopware/platform.git
composer install
npm install -g npm
npm install in vendor/shopware/platform/src/Administration/Resources/administration/

./psh.phar init
./psh.phar administration:init
./psh.phar administration:build

usermod -a -G www-data $(whoami)
chgrp -R www-data $HOME/shopware-dev
find $HOME/shopware-dev -type d -exec chmod g+s '{}' \;
#chmod g+w -R $HOME/shopware-dev/{var,public/{media,thumbnail}}
chmod g+w -R $HOME/shopware-dev/var
#chmod g+w -R $HOME/shopware-dev/public/thumbnail
chmod g+w -R $HOME/shopware-dev/public/media


echo "127.0.0.1 shopware.test" | tee --append /etc/hosts
ln -s $HOME/shopware-dev /var/www/shopware.test

/etc/init.d/apache2 restart

echo "LISTEN 8000

<VirtualHost *:8000>
    DocumentRoot "/var/www/shopware.test/public"
    ServerName shopware.test
    <Directory "/var/www/shopware.test/public">
        AllowOverride All
    </Directory>
</VirtualHost>" > /etc/apache2/sites-available/shopware.test.conf

# enable shopware vhost
a2ensite shopware.test.conf
# disable default vhost
a2dissite 000-default.conf
# enable mod_rewrite
a2enmod rewrite
# restart apache (changed)
/etc/init.d/apache2 restart

curl http://shopware.test:8000/admin

