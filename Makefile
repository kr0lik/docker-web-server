docker_php = my-web-php
docker_go = my-web-go

all: #Start docker containers
	@docker-compose up -d

stop: #Stop docker containers
	@docker-compose stop

down: #Down docker containers
	@docker-compose down

restart: #Restart docker containers
	@docker-compose restart

web: #Start web server
	@docker-compose up -d nginx php

mysql: #Start mysql db
	@docker-compose up -d mysql adminer

pgsql: #Start pgsql db
	@docker-compose up -d pgsql adminer

golang: #Start golang
	@docker-compose up -d go
	
rabbitmq: #Start rabbitMQ
	@docker-compose up -d rabbitmq

redis: #Start redis
	@docker-compose up -d redis

memcached: #Start memcached
	@docker-compose up -d memcached

portainer: #Start portainer
	@docker-compose up -d portainer

bash_php: #Use bash commad line for php
	@docker exec -it $(docker_php) sh

bash_golang: #Use bash commad line for go
	@docker exec -it $(docker_go) sh
