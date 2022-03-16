#!/bin/bash
sed -i 's/bind-ad/#bind-ad/g' /etc/mysql/mariadb.conf.d/50-server.cnf

if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html/
	cd /var/www/html
	wp core download --allow-root
	wp core config	--allow-root \
					--dbhost="$DB_HOST" \
					--dbname="$DB_NAME" \
					--dbuser="$DB_USER" \
					--dbpass="$DB_USER_PASS"
	chmod 644 wp-config.php
	wp core install --allow-root \
					--url="$WP_URL" \
					--title="$WP_TITLE" \
					--admin_user="$WP_ADMIN" \
					--admin_password="$WP_ADMIN_PASS" \
					--admin_email="$WP_ADMIN_EMAIL"
	wp user create --allow-root "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASS"
fi

/usr/sbin/php-fpm7.3 --nodaemonize
