#!bin/bash

apt-get update
apt upgrade -y
DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
apt-get install -y php7.4
apt-get install -y git
apt-get install -y composer
apt-get install -y mysql-client
apt-get install -y apache2
