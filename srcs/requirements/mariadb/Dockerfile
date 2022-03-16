# BASE IMAGE
FROM debian:buster

RUN		apt-get update && apt-get -y upgrade &&\
		apt-get -y install mariadb-server
COPY start.sh ./
RUN chmod +x ./start.sh
ENTRYPOINT ./start.sh
