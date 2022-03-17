#!/bin/bash
sed -i 's/bind-ad/#bind-ad/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Configure a wordpress database
if [ ! -d /var/lib/mysql/wp ]; then
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME" | mysql -u root --skip-password
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS'" | mysql -u root --skip-password
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION" | mysql -u root --skip-password
	echo "FLUSH PRIVILEGES" | mysql -u root --skip-password
	mysqladmin -u root password $ROOT_PASS
	service mysql stop
fi
mysqld_safe



# #!/bin/bash
# sed -i 's/\/run\/php\/php7.3-fpm.sock/wordpress:9000/g' etc/php/7.3/fpm/pool.d/www.conf
# mkdir -p /run/php
# chown -R www-data:www-data /var/www/*
# chmod -R 755 /var/www/*
# while ! mysql -h mariadb -u $DB_USER -p$DB_USER_PASS $DB_NAME -e "SELECT 'OK' AS status;"; do
#     sleep 5
# done
# if [ ! -f /var/www/html/wp-config.php ]; then
# 	mkdir -p /var/www/html
# 	cd /var/www/html
# 	wp core download --allow-root
# 	wp core config	--allow-root --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PASS}
# 	chmod 644 wp-config.php
# 	wp core install --allow-root \
# 					--url=${WP_URL} \
# 					--title=${WP_TITLE} \
# 					--admin_user=${WP_ADMIN} \
# 					--admin_password=${WP_ADMIN_PASS} \
# 					--admin_email=${WP_ADMIN_EMAIL}
# 	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS}
# fi


# /usr/sbin/php-fpm7.3 --nodaemonize
