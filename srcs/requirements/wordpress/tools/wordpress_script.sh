#!/bin/bash


sleep 2


mkdir -p /var/www/html


cd /var/www/html


rm -rf *


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 


chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root


wp core config --dbhost="mariadb" --dbname="$db_name" --dbuser="$db_user" --dbpass="$db_pwd" --path="/var/www/html" --allow-root


wp core install --url="$DOMAIN_NAME/" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USR" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root


wp user create "$WP_USR" "$WP_EMAIL" --role=author --user_pass="$WP_PASS" --allow-root


wp core is-installed --allow-root


wp user list --allow-root


wp theme install oceanwp --activate --allow-root


wp plugin update --all --allow-root

mkdir /run/php

/usr/sbin/php-fpm7.4 -F
