if [ ! $(wp core is-installed --path=/var/www/html --allow-root)]; then
  wp core download --allow-root

  sleep10
  wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb:3306 --allow-root

  sleep 5
  wp core install--url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PASSWORD} \
                --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
  wp user create ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --allow-root
fi

php-fpm7.4 -F
