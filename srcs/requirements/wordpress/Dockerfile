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

WORKDIR  /tmp
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN mv wordpress /var/www/
RUN chmod -R 755 /var/www/wordpress/ \
	chown -R www-data:www-data /var/www/wordpress/

EXPOSE 9000