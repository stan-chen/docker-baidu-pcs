FROM ubuntu:latest

MAINTAINER ChenXuefei <chenxuefei_pp@163.com>

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bk
COPY sources.list /etc/apt/sources.list

RUN apt-get update -y && \
    apt-get install -y --force-yes \
	git \
	gcc g++ build-essential libcurl4-openssl-dev libssl-dev \
   rm -rf /var/lib/apt/lists/*

WORKDIR /opt/src
RUN git clone https://github.com/GangZhuo/BaiduPCS.git &&\
    make clean &&\
    make &&\
    make install
    
ENTRYPOINT pcs login --username=$USERNAME --password=$PASSWORD && /bin/bash