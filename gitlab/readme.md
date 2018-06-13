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

docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest


2. 注册runner
    docker run --rm -t -i 
    gitlab/gitlab-runner register