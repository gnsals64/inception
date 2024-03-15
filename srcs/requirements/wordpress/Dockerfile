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
# php-fpm의 www.conf 파일에서 설정을 수정, 작업 디렉토리 변경
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
# listen = 127.0.0.1:9000로 설정된 경우, PHP-FPM은 로컬 호스트(127.0.0.1)의 9000 포트에서만 연결을 수신
# 모든 네트워크 인터페이스(로컬 루프백 및 외부 네트워크)에서 9000 포트로 들어오는 연결을 수신하도록 변경
# 웹 서버나 다른 시스템에서 PHP-FPM과 연결 가능해짐

COPY ./tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
EXPOSE 9000
ENTRYPOINT ["sh", "/tmp/script.sh"]
