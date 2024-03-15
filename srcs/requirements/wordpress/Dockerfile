FROM  debian:bullseye

RUN   apt-get update && apt-get upgrade
#wordpress에 연결하기 위한 기본 php프로그램들 설치
RUN apt-get install -y  \
		php \
		php-fpm \
		php-mysql \
		php-fpm php-curl \
		php-gd \
		php-intl \
		php-mbstring \
		php-soap \
		php-xml \
		php-xmlrpc \
		php-zip \
		mariadb-server \
		mariadb-client \
		curl 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /bin/wp



RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN sed -i 's/;chdir = \/var\/www/chdir = \/var\/www\/html/g' /etc/php/7.4/fpm/pool.d/www.conf
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf


COPY ./tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
EXPOSE 9000
CMD [ "php-fpm7.4 -F" ]
ENTRYPOINT ["sh", "/tmp/script.sh"]
