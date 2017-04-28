

# Docker 百度云命令行工具

> 该镜像为百度云pcs命令行工具，可以开多个docker同时下载文件夹

## 使用方式

    docker run -itd \
    -e USERNAME=<百度云账号> \
    -e PASSWORD=<百度云密码> \
    -e REMOTE_NAME=<需要下载的文件夹> \
    -e PCS_MAX_THREAD_NUM=<根据硬件配置线程数> \
    -v local_path:/download \
    image:latest
