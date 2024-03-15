if [ ! $(wp core is-installed --path=/var/www/html --allow-root)]; then
  wp core download --allow-root
  wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWD} --dbhost=mariadb:3306 --allow-root
  wp core install--url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PASSWD} \
                --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
  wp user create ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWD} --allow-root
fi