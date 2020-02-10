FROM ubuntu
MAINTAINER U MONJI
RUN apt-get update
RUN apt-get install -y nginx
COPY ./files/ /var/www/html
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
EXPOSE 80
