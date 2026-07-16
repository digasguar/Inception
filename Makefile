NAME = inception

COMPOSE = docker compose -f srcs/docker-compose.yml
BONUS = -f srcs/docker-compose.bonus.yml

up:
	mkdir -p /home/dgasco-g/data/mariadb
	mkdir -p /home/dgasco-g/data/wordpress
	$(COMPOSE) up --build -d

down:
	$(COMPOSE) down

bonus:
	$(COMPOSE) $(BONUS) up --build -d

bonus-down:
	$(COMPOSE) $(BONUS) down

clean:
	docker system prune -af
