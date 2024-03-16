FROM debian:bullseye
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx && apt-get install -y openssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/inception.crt -keyout /etc/nginx/inception.key -subj "/C=CH/ST=Vaud/L=Renens/O=42/OU=42/CN=hunpark.42.fr"
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]
