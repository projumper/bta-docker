FROM ubuntu:latest
 
RUN apt-get update 
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y php7.4
RUN apt-get install apache2
 
 
WORKDIR /var
