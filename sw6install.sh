#!bin/bash

sudo apt-get update
sudo apt upgrade -y
sudo DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
sudo apt-get install -y php7.4
sudo apt-get install -y git
sudo apt-get install -y composer
sudo apt-get install -y mysql-client
sudo apt-get install -y apache2
