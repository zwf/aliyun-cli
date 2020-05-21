# Aliyun CLI
aliyun cli tools docker image base on busybox

## how to config as a native cli

1. pull image from hub.docker.com

   ```bash
   docker pull zhangweifang/aliyun-cli
   ```

2. add alias to env

   ```bash
   alias ossutil='docker run --rm -ti -v $(your aliyun cli config file path):/root/.aliyun -v $(pwd):/cli zhangweifang/aliyun-cli aliyun'
   ```

