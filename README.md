# Ready Web Server on docker

This is test of staurt up web server for my home works by docker.

Tested on debian linux.


# Installation

To install this server you need:

1. Install [docker](https://docs.docker.com/install/linux/docker-ce/debian/).

2. Install [docker-compose](https://docs.docker.com/compose/install/).

3. Donwload this pack and in this folder run:
```
$ make start
``` 

4. Add 127.0.0.1 web.local to your hosts file

5. Go to http://web.local


# Help commands

Stop docker: make stop

Show processes: make show

Run bash for php: make bash


# CLI use

Fist way:
```
$ sudo docker run --rm -v $(pwd):/app -w /app php:cli php index.php
```

Second way:
```
$ make bash
```
