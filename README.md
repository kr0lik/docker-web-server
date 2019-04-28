# Ready Web Server on docker

This is test of staurt up web server for my home works by docker.

Tested on Debian linux and Windows 10 subsystem linux Ubuntu.


# Installation

To install this server you need:

1. Install [docker](https://docs.docker.com/install/linux/docker-ce/debian/).

2. [Manage Docker as a non-root user](https://docs.docker.com/install/linux/linux-postinstall/)

3. Install [docker-compose](https://docs.docker.com/compose/install/).

4. Donwload this pack and in this folder run:
```
$ make start
``` 

5. Add 127.0.0.1 test.local to your hosts file

6. Go to http://test.local

7. Go to http://localhost:90


# Usage

1. Create folder in www for your project

2-1. Add 127.0.0.1 <folder_name_of_your_project>.local to your hosts

2-2. You can cretae your own nginx config in hosts folder

3. GO to http://<folder_name_of_your_project>.local


# Help commands

Start all containers: $ make all

Stop docker: $ make stop

Down docker: $ make down

Restart docker: $ make restart

Show processes: $ make status

Run web containers: $ make web

Run MySql container + Adminer: $ make mysqldb

Run PgSql container + Adminer: $ make pgsqldb

Run Go: $ make golang

Run bash for php: $ make bash_php

Run bash for go: $ make bash_go

Run bash for nginx $ make bash_nginx

Run portainer: $ make portainer

# CLI use

Fist way:
```
$ make php
```

Second way:
```
$ docker-compose run php bash
```

Third way:
```
$ sudo docker run --rm -v $(pwd):/app -w /app php:cli php index.php
```

# GO

First way:
```
$ make golang
```

Second way:
```
$ docker-compose run go go run <go_file in go folder>
```

Third way:
```
$ docker-compose run go bash
```
