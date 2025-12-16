NAME = inception

DOCKER_COMPOSE_BIN = docker compose
DOCKER_COMPOSE = $(DOCKER_COMPOSE_BIN) -f srcs/docker-compose.yaml

DATA_DIR = $(HOME)/data
MARIADB_DIR = $(DATA_DIR)/mariadb
WP_DIR = $(DATA_DIR)/wordpress

all: up

data:
	mkdir -p $(MARIADB_DIR) $(WP_DIR)

build: data
	$(DOCKER_COMPOSE) build

up: build
	$(DOCKER_COMPOSE) up -d

image:
	docker image ls

down:
	$(DOCKER_COMPOSE) down

ps:
	$(DOCKER_COMPOSE) ps

mariadb:
	docker exec -it mariadb mysql -u root -p

clean:
	$(DOCKER_COMPOSE) down --remove-orphans

fclean: clean
	$(DOCKER_COMPOSE) down -v --rmi all --remove-orphans && sudo rm -rf $(HOME)/data/*\
	&& docker stop $(docker ps -aq) && docker rm $(docker ps -aq)\
 	&& docker rmi -f $(docker images -aq)\
	&& docker volume rm $(docker volume ls -q) 2>/dev/null || true && docker network prune -f\
	&& docker builder prune -a -f && docker system prune -a -f

re: fclean all

.PHONY: all data build up image down ps mariadb clean fclean re
