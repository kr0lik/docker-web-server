# Ready Web Server on docker

This is test of staurt up web server for my home works by docker.

Alpine based

# Installation

To install this server you need:

1. Install [docker](https://docs.docker.com/install/linux/docker-ce/debian/).

2. [Manage Docker as a non-root user](https://docs.docker.com/install/linux/linux-postinstall/)

3. Install [docker-compose](https://docs.docker.com/compose/install/).

4. Donwload this pack and in this folder run:
```
$ make start
``` 

5-1. Go to http://localhost

5-2. Go to http://localhost:90

5-3. Go to http://localhost:7000

5-4. Go to http://localhost:15672

5-5. Go to http://localhost:9000

# Usage

1. Create folder in projects-php/projects-golang/projects-js for your project

2-1. Create your own nginx config in docker/nginx/conf.d
2-2. Create your own php config in docker/php/php-fpm.d
2-3. Create your own init sh in docker/mysql/bin
2-4. Create your own init sh in docker/pgsql/bin

3. Copy .env.dist to .env and edit it

4. Open in http


# Help commands

Start all containers: $ `make all`

Stop docker: $ `make stop`

Down docker: $ `make down`

Restart docker: $ `make restart`

Run nginx + php: $ `make web`

Run MySql + Adminer: $ `make mysql`

Run PgSql + Adminer: $ `make pgsql`

Run Go: $ `make golang`

Run RabbitMQ: $ `make rabbitmq`

Run Redis: $ `make redis`

Run Memcached: $ `make memcached`

Run bash for php: $ `make bash_php`

Run bash for go: $ `make bash_go`

Run Portainer: $ `make portainer`

# CLI use

Fist way:
```
$ make bash_php
```

Second way:
```
$ docker-compose run php php <php_file in php-fpm folder>
```

Third way:
```
$ docker-compose run php bash
```

# GO

First way:
```
$ make bash_golang
```

Second way:
```
$ docker-compose run go go run <go_file in go folder>
```

Third way:
```
$ docker-compose run go bash
```
