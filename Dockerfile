FROM ubuntu:latest
 
RUN apt-get update 
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y php7.4
RUN apt-get install -y git
#RUN apt-get install apache2
 
#ADD ./my-project /var/www/html
CMD ["apachectl", "start"]
#WORKDIR /var
