all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v

vclean:
	sudo rm -rf /home/mharriso/data/DataBase/*
	sudo rm -rf /home/mharriso/data/WordPress/*
	#docker volume rm $$(docker volume ls -q)

fclean: vclean
	sudo docker rmi $$(docker images -q)

