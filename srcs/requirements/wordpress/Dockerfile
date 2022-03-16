# BASE IMAGE
FROM debian:buster

RUN		apt-get update && apt-get -y upgrade &&\
		apt-get -y install php7.3 php-fpm php-mysql mariadb-client wget

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		chmod +x wp-cli.phar \
		sudo mv wp-cli.phar /usr/local/bin/wp

RUN		chown -R www-data:www-data /var/www/* \
		chmod -R 755 /var/www/*

COPY start.sh ./
RUN chmod +x ./start.sh
ENTRYPOINT ./start.sh
