#!/bin/bash

service mariadb start
sleep 5

#DB 만들기
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

#user 만들기
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

#DB 권한 부여하기
mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

#설정 적용
mariadb -e "FLUSH PRIVILEGES;"

#root의 비밀번호 설정 (비밀번호 설정시 root 계정 외에는 접속 불가)
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

#mysql 껐다 켜기
mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown
exec mariadbd
