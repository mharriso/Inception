all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v

vclean:
	sudo rm -rf /home/mharriso/data/DataBase/*
	sudo rm -rf /home/mharriso/data/WordPress/*

fclean: vclean
	sudo docker rmi $$(docker images -q)

