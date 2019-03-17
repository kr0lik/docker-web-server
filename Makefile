docker_php = docker-web-server_php_1
docker_go = docker-web-server_go_1

start: #Start docker containers
	@docker-compose up -d

stop: #Stop docker containers
	@docker-compose down

restart: #Restart docker containers
	@docker-compose restart

status: #Show docker containers
	@docker ps

php: #Use bash commad line for php
	@docker exec -it $(docker_php) bash

golang: #Use bash commad line for go
	@docker exec -it $(docker_go) bash
