#
# 安装镜像
#

#vpc网络

#基础核心
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/etcd-amd64:3.1.12
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kube-apiserver-amd64:v1.10.0
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kube-scheduler-amd64:v1.10.0
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kube-controller-manager-amd64:v1.10.0
#网络
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/flannel:v0.10.0-amd64
dcoker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/k8s-dns-dnsmasq-nanny-amd64:1.14.8
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/k8s-dns-sidecar-amd64:1.14.8
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/k8s-dns-kube-dns-amd64:1.14.8
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/pause-amd64:3.1
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kube-proxy-amd64:v1.10.0
#dashboard
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kubernetes-dashboard-amd64:v1.8.3
#heapster
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/heapster-influxdb-amd64:v1.3.3
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/heapster-grafana-amd64:v4.4.3
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/heapster-amd64:v1.4.2
#ingress 不用改名
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/nginx-ingress-controller:0.9.0
docker pull registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/defaultbackend:1.4

#还原kubernetes使用的镜像
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/etcd-amd64:3.1.12 k8s.gcr.io/etcd-amd64:3.1.12  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kube-apiserver-amd64:v1.10.0 k8s.gcr.io/kube-apiserver-amd64:v1.10.0  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kube-scheduler-amd64:v1.10.0 k8s.gcr.io/kube-scheduler-amd64:v1.10.0  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kube-controller-manager-amd64:v1.10.0 k8s.gcr.io/kube-controller-manager-amd64:v1.10.0  

docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/flannel:v0.10.0-amd64 quay.io/coreos/flannel:v0.10.0-amd64  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/pause-amd64:3.1 k8s.gcr.io/pause-amd64:3.1  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kube-proxy-amd64:v1.10.0 k8s.gcr.io/kube-proxy-amd64:v1.10.0  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/k8s-dns-kube-dns-amd64:1.14.8 k8s.gcr.io/k8s-dns-kube-dns-amd64:1.14.8  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/k8s-dns-dnsmasq-nanny-amd64:1.14.8 k8s.gcr.io/k8s-dns-dnsmasq-nanny-amd64:1.14.8  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/k8s-dns-sidecar-amd64:1.14.8 k8s.gcr.io/k8s-dns-sidecar-amd64:1.14.8 

docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/kubernetes-dashboard-amd64:v1.8.3 k8s.gcr.io/kubernetes-dashboard-amd64:v1.8.3  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/heapster-influxdb-amd64:v1.3.3 k8s.gcr.io/heapster-influxdb-amd64:v1.3.3  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/heapster-grafana-amd64:v4.4.3 k8s.gcr.io/heapster-grafana-amd64:v4.4.3  
docker tag registry-vpc.cn-qingdao.aliyuncs.com/ly-k8s/heapster-amd64:v1.4.2 k8s.gcr.io/heapster-amd64:v1.4.2  
#公网







