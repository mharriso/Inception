#!/bin/bash
sed -i 's/bind-ad/#bind-ad/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Configure a wordpress database
if [ ! -d /var/lib/mysql/wp ]; then
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME" | mysql -u root --skip-password
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'" | mysql -u root --skip-password
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION" | mysql -u root --skip-password
	echo "FLUSH PRIVILEGES" | mysql -u root --skip-password
	mysqladmin -u root password $ROOT_PASS
	service mysql stop
fi
mysqld_safe
