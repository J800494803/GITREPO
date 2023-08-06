FROM ubuntu:latest
MAINTAINER ="danamajaybabu@gmail.com"
RUN apt-get update && apt-get -y install apache2
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-D", "FOREGROUND"]
COPY index.html /var/www/html/index.html
VOLUME /var/www/html
