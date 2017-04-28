FROM alpine

MAINTAINER ChenXuefei <chenxuefei_pp@163.com>

RUN echo "http://mirrors.aliyun.com/alpine/v3.5/main" > /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.5/community" >> /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update

RUN apk add --update --no-cache git bash curl-dev
RUN apk add --update --no-cache --virtual gcc g++ make perl && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

WORKDIR /opt/src
RUN git clone https://github.com/GangZhuo/BaiduPCS.git &&\
    make clean &&\
    make &&\
    make install
    
ENTRYPOINT pcs login --username=$USERNAME --password=$PASSWORD && /bin/bash