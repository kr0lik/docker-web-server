docker_php = docker-web-server_php_1
docker_go = docker-web-server_go_1

all: #Start docker containers
	@docker-compose up -d

stop: #Stop docker containers
	@docker-compose stop

down: #Down docker containers
	@docker-compose down

restart: #Restart docker containers
	@docker-compose restart

status: #Show docker containers
	@docker ps

mysqldb: #Start mysql db
	@docker-compose up -d mysql

pgsqldb: #Start pgsql db
	@docker-compose up -d pgsql

web: #Start web server
	@docker-compose up -d nginx

gitlab: #Start gitlab
	@docker-compose up -d gitlab

php: #Use bash commad line for php
	@docker exec -it $(docker_php) bash

golang: #Use bash commad line for go
	@docker exec -it $(docker_go) bash
