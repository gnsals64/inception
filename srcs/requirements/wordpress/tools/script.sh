if [ ! $(wp core is-installed --path=/var/www/html)]; then
  wp core download --allow-root
  wp config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWD} --dbhost=mariadb:3306
  wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PASSWD} \
                --admin_email=${WP_ADMIN_EMAIL} --skip-email
  wp user create --allow-root ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWD}
fi

php-fpm7.4 -F