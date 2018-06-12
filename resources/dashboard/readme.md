kubernetes dashboard 的安装

1. 安装kube-dashboard.yaml
2. 安装kube-dashboard-admin.rbac.yaml
3. 想要访问 本机需要kubectl 把master下的 /etc/kubernetes/admin.conf 拷贝到机器下用户目录下.kube文件夹中的config 修改ip为外网ip
4. kubectl proxy 开启代理
5. http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
6. 查找kubernetes-dashboard-admin secret 下的token登陆即可