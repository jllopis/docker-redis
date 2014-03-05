# docker-redis

# Version

redis v2.8.6

# Build from repository

(https://github.com/jllopis/docker-redis)

````bash

$ git clone git@github.com:jllopis/docker-redis.git
$ cd docker-redis
$ docker build t my_user/redis:latest
````

# Start

````bash

# docker run -d -p 6379:6379 -v {local_fs}:/var/lib/redis -v {local_fs}:/var/log/redis -t -h {node_host_name} -name {image_name} redis:latest
````

where:

- **local_fs** is the local storage to keep data safe. If not specified it will use the container so the data will be lost upon restart.
- **node_hostname** is the name that will hold the HOSTNAME variable inside the container. This is accessible to CMD so etcd will use it as their node name. If not specified a default name wil be used.
- **image_name** is the name given to the image so you don't have to play with ids

You can also start redis-server with command line options:

````bash

# docker run -d -p 7777:7777 -v {local_fs}:/var/lib/redis -v {local_fs}:/var/log/redis -t -h {node_host_name} -name {image_name} redis:latest redis-server --port 7777
````

# Ports

The ports used are:

- 6379

Remember that if you want access from outside the container you must explicitly tell docker to do so by setting -p at image launch.

