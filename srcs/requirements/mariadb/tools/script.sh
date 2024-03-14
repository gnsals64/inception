#!/bin/bash

service mariadb start

sleep 5

mysql_secure_installation << EOF
n
${DB_ROOT_PASSWORD}
${DB_ROOT_PASSWORD}
y
n
n
n
n
EOF

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown
exec mariadbd
