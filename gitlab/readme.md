1. gitlab gitlab-runner 做为CI\CD的支撑
2. 这些要容器化
3. images gitlab-ce gitlab-runner



sudo docker run --detach \
    --hostname 47.104.236.159 \
    --publish 443:443 --publish 80:80 --publish 2020:22 \
    --name gitlab \
    --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest


gitlab-runner docker
1. 启用守护进程 
docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

2. 注册runner
    docker run --rm -t -i -v /srv/gitlab-runner/config:/etc/gitlab-runner --name gitlab-runner gitlab/gitlab-runner register










------------------------------------------------------helm 安装方式 -----------------------
1. 一个kubernetes cluster 群集
2. helm 安装
3. helm repo add gitlab https://charts.gitlab.io 加载这个charts
4. helm 