docker_php = my-php
docker_go = my-go
docker_nginx = my-nginx

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

golang: #Start golang
	@docker-compose up -d go

web: #Start web server
	@docker-compose up -d nginx

portainer: #Start portainer
	@docker-compose up -d portainer

bash_nginx: #Use bash commad line for nginx
	@docker exec -it $(docker_nginx) bash

bash_php: #Use bash commad line for php
	@docker exec -it $(docker_php) bash

bash_go: #Use bash commad line for go
	@docker exec -it $(docker_go) bash
