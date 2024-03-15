FROM  debian:bullseye

RUN   apt-get update && apt-get upgrade
#wordpress에 연결하기 위한 기본 php프로그램들 설치
RUN apt-get install -y  \
		php \
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
		curl \
		wget  

RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www

WORKDIR  /tmp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /bin/wp 


EXPOSE 9000