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


# Usage

1. Create filder in www for your project

2. Add 127.0.0.1 <filder_name_of_your_project>.local to your hosts

3. GO to http://<filder_name_of_your_project>.local


# Mutiple projects
1. Create folder with <project_name> in www

2. Add 127.0.0.1 <project_name>.local to your hosts file


# Help commands

Start docker: $ make start

Stop docker: $ make stop

Resart docker: $ make restart

Show processes: $ make status

Run bash for php: $ make bash


# CLI use

Fist way:
```
$ make bash
```

Second way:
```
$ sudo docker run --rm -v $(pwd):/app -w /app php:cli php index.php
```

