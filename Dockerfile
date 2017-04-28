FROM ubuntu:latest

MAINTAINER ChenXuefei <chenxuefei_pp@163.com>

# 更新ubuntu源到阿里云
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bk
COPY sources.list /etc/apt/sources.list

# 安装编译时软件
RUN apt-get update -y && \
    apt-get install -y \
	git \
	gcc g++ build-essential libcurl4-openssl-dev libssl-dev && \
   rm -rf /var/lib/apt/lists/*

# 开始进行编译
WORKDIR /opt/src
RUN git clone https://github.com/GangZhuo/BaiduPCS.git &&\
    cd ./BaiduPCS &&\
    make clean &&\
    make &&\
    make install 

# 编译完成 开始清理编译时空间    
RUN rm -rf /opt/src
WORKDIR /
RUN apt-get autoremove -y \
    git gcc g++ build-essential && \
    mkdir /download

ADD download.sh /download.sh
RUN chmod +x /download.sh
ENV PCS_MAX_THREAD_NUM 20
WORKDIR /download   
VOLUME ["/download"] 
ENTRYPOINT pcs login --username=$USERNAME --password=$PASSWORD &&\
        pcs set --max_thread=$PCS_MAX_THREAD_NUM &&\
        /bin/bash /download.sh