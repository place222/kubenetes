1. 环境
    1. 要求python2.7 以上 
    2. docker1.10以上
    3. docker-compose 1.6以上
        1. sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
        2. sudo chmod +x /usr/local/bin/docker-compose
        3. docker-compose --version
2. 下载发行
    wget https://storage.googleapis.com/harbor-releases/release-1.5.0/harbor-offline-installer-v1.5.1.tgz
    tar xvf harbor-offline-installer-v1.5.1.tgz
3. 编写配置文件 harbor.cfg
4. 编辑docker-compose.yml 下的ports:端口
    1. 1180:80 1443:443 14443:4443
5. 编辑 common/templates/registry/config.yml 下加入
    1. realm:$public-url:1180 补上端口 (如果这个hostname后面有端口号 这个就不用了)
6. 编辑 harbor.cfg hostname补上端口
7. ./install.sh
8. 默认管理员用户名/密码为admin / Harbor12345。

docker login 47.104.236.159:1180

docker tag node:9-slim 47.104.236.159/hello-word/node:9-slim

docker push 47.104.236.159/hello-word/node:9-slim