# 워드프레스 설치 여부 체크 후 다운로드
if [ ! -f "/var/www/html/index.php" ]; then
  wp core download
# 워드프레스 설정파일인 wp-config.php 생성, 마리아디비 포트 3306 연결 및 데이터베이스 설정
  wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWD} --dbhost=mariadb:3306
  wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PWD} \
                --admin_email=${WP_ADMIN_EMAIL} --skip-email
# 워드프레스 설치 및 초기 설정
  wp user create ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass=${WP_USER_PWD}
# 워드프레스에 새로운 유저 생성
fi

service php-fpm start
# php-fpm 서버 실행. forground shell session not deamon