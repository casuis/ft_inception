all: up

up:
		systemctl restart docker 
		docker compose -f srcs/docker-compose.yml build #--no-cache
		docker compose -f srcs/docker-compose.yml up --force-recreate #-d --force-recreate


down:
		docker compose -f srcs/docker-compose.yml down 

ps:		
		docker compose -f srcs/docker-compose.yml ps -a
		docker ps -a

clean:	down
		docker system prune
		docker volume rm srcs_db srcs_wordpress

		sudo rm -rf /home/${USER}/data/db
		sudo rm -rf /home/${USER}/data/wordpress
		
		mkdir -p /home/${USER}/data/db
		mkdir -p /home/${USER}/data/wordpress

re : 	clean up

mariadb:
		docker exec -it mariadb bash
nginx:
		docker exec -it nginx bash

wordpress:
		docker exec -it wordpress bash


.PHONY: start stop re ps clean
