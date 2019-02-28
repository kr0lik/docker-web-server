docker_php = docker-web-server_php_1

start: #Start docker containers
	@sudo docker-compose up -d

stop: #Stop docker containers
	@sudo docker-compose stop

show: #Show docker containers
	@sudo docker ps

bash: #Use bash commad line for php
	@sudo docker exec -it $(docker_php) bash
