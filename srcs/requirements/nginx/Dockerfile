FROM debian:bullseye
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx && apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CH/ST=Vaud/L=Renens/O=42/OU=42/CN=hunpark.42.fr"
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
