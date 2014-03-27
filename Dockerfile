FROM ubuntu:12.04
MAINTAINER Joan Llopis <jllopisg@gmail.coms>

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LC_ALL es_ES.UTF-8

# hopefully temporary work-around of http://git.io/Ke_Meg#1724 
RUN apt-mark hold initscripts udev plymouth mountall

RUN apt-get -y update && \
    apt-get install -y python-software-properties && \
    add-apt-repository -y ppa:chris-lea/redis-server ;\
    apt-get -y update && \
    apt-get -y upgrade --no-install-recommends

RUN apt-get install -y redis-server=2:2.8.7-1chl1~precise1 --no-install-recommends

RUN sysctl -w vm.overcommit_memory=1

ADD redis.conf.orig /etc/redis/redis.conf

EXPOSE 6379

VOLUME /var/lib/redis
VOLUME /var/log/redis

ENTRYPOINT ["/usr/bin/redis-server"]
CMD ["/etc/redis/redis.conf"]

# To run:
# docker run -d -p 6379:6379 -v {local_fs}:/var/lib/redis -v {local_fs}:/var/log/redis -t -h {node_host_name} -name {image_name} redis:latest
# docker run -d -p 7777:7777 -v {local_fs}:/var/lib/redis -v {local_fs}:/var/log/redis -t -h {node_host_name} -name {image_name} redis:latest redis-server --port 7777


