http://blog.51cto.com/yylinfan/2116863

下载ymal配置文件

wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/namespace.yaml

wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/default-backend.yaml

wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/tcp-services-configmap.yaml

wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/udp-services-configmap.yaml

如果启用了RBAC，那么还需要下面的两个：

wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/rbac.yaml

wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/with-rbac.yaml


修改镜像地址为国内镜像，国外的需要×××，网速你懂的。

default-backend.yaml：

image: registry.cn-hangzhou.aliyuncs.com/google_containers/defaultbackend:1.4

 

with-rbac.yaml：

image: lizhenliang/nginx-ingress-controller:0.9.0

添加hostNetwork: true在serviceAccountName: nginx-ingress-serviceaccount下边

默认官方下载的没有hostNetwork: true这一项，这样就无法让用户访问到，这是一个坑




开始安装

// 创建命名空间

kubectl create -f namespace.yaml

 

// 创建默认虚拟主机

kubectl create -f default-backend.yaml

kubectl get pod -n ingress-nginx

 

// 创建tcp和udp configmap

kubectl create -f tcp-services-configmap.yaml

kubectl create -f udp-services-configmap.yaml

 

// 创建rbac角色

kubectl create -f rbac.yaml

 

// 部署Ingress Controller

kubectl create -f with-rbac.yaml

 

查看是不是部署起来了

kubectl get pod  -n  ingress-nginx






