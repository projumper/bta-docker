FROM ubuntu:latest
 
RUN apt-get update 
RUN apt-get install -y php7
RUN sudo apt-get install apache2
 
 
WORKDIR /var