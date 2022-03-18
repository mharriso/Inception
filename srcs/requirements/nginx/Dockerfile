# BASE IMAGE
FROM debian:buster

RUN		apt-get update && apt-get -y upgrade && \
		apt-get -y install openssl nginx

RUN		openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=/L=/O=/OU=42moscow/CN=mharriso" \
		-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt

COPY	default /etc/nginx/sites-available

CMD [ "nginx", "-g", "daemon off;"]
