all:
	
	@docker compose -f ./srcs/docker-compose.yml up --build 

down:
	@docker compose -f ./srcs/docker-compose.yml down

re: down all
	@docker compose -f ./srcs/docker-compose.yml up --build

clean:
	docker system prune -af 
	docker volume rm  srcs_mariadb srcs_wordpress