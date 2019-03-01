docker_php = docker-web-server_php_1

start: #Start docker containers
	@docker-compose up -d

stop: #Stop docker containers
	@docker-compose stop

show: #Show docker containers
	@docker ps

bash: #Use bash commad line for php
	@docker exec -it $(docker_php) bash
