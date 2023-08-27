all : data_folder
	@docker compose -f ./srcs/docker-compose.yml up -d --build

data_folder:
	@mkdir -p /Users/nnakarac/data/wordpress /Users/nnakarac/data/mariadb

down :
	@docker compose -f ./srcs/docker-compose.yml down

re :
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean : down
	docker volume rm $$(docker volume ls -q);
	docker rmi -f $$(docker images -qa);

.PHONY: all data_folder down re clean
