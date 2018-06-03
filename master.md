1. master节点，执行下面的命令：

    docker pull cnych/kube-apiserver-amd64:v1.10.0  
    docker pull cnych/kube-scheduler-amd64:v1.10.0  
    docker pull cnych/kube-controller-manager-amd64:v1.10.0  
    docker pull cnych/kube-proxy-amd64:v1.10.0  
    docker pull cnych/k8s-dns-kube-dns-amd64:1.14.8  
    docker pull cnych/k8s-dns-dnsmasq-nanny-amd64:1.14.8  
    docker pull cnych/k8s-dns-sidecar-amd64:1.14.8  
    docker pull cnych/etcd-amd64:3.1.12  
    docker pull cnych/flannel:v0.10.0-amd64  
    docker pull cnych/pause-amd64:3.1  
    
    docker tag cnych/kube-apiserver-amd64:v1.10.0 k8s.gcr.io/kube-apiserver-amd64:v1.10.0  
    docker tag cnych/kube-scheduler-amd64:v1.10.0 k8s.gcr.io/kube-scheduler-amd64:v1.10.0  
    docker tag cnych/kube-controller-manager-amd64:v1.10.0 k8s.gcr.io/kube-controller-manager-amd64:v1.10.0  
    docker tag cnych/kube-proxy-amd64:v1.10.0 k8s.gcr.io/kube-proxy-amd64:v1.10.0  
    docker tag cnych/k8s-dns-kube-dns-amd64:1.14.8 k8s.gcr.io/k8s-dns-kube-dns-amd64:1.14.8  
    docker tag cnych/k8s-dns-dnsmasq-nanny-amd64:1.14.8 k8s.gcr.io/k8s-dns-dnsmasq-nanny-amd64:1.14.8  
    docker tag cnych/k8s-dns-sidecar-amd64:1.14.8 k8s.gcr.io/k8s-dns-sidecar-amd64:1.14.8  
    docker tag cnych/etcd-amd64:3.1.12 k8s.gcr.io/etcd-amd64:3.1.12  
    docker tag cnych/flannel:v0.10.0-amd64 quay.io/coreos/flannel:v0.10.0-amd64  
    docker tag cnych/pause-amd64:3.1 k8s.gcr.io/pause-amd64:3.1  

2. 初始化集群
    1.命令
        kubeadm init --kubernetes-version=v1.10.0 --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=172.31.237.192

    2.初始化按显示的内容敲
        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config

    3. kubectl get cs 查看群集状态
        root@vmlin0545:~# kubectl get cs
        NAME                 STATUS    MESSAGE              ERROR
        controller-manager   Healthy   ok                   
        scheduler            Healthy   ok                   
        etcd-0               Healthy   {"health": "true"}   

3. 启用基于flannel的Pod网络
    1. wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    2. kubectl apply -f  kube-flannel.yml
    3. kubectl get pods --all-namespaces
    
4. 拷贝这个joinkey到node节点 开始设置node节点
        kubeadm join 172.31.237.192:6443 --token xkrn2s.vadk9wil4ajrcuho --discovery-token-ca-cert-hash sha256:60e72249f33863e3c4ec855547468507d3dea6bf6dfca2016a963ac249bc0dbc


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5. 设置完node节点后 可以加入dashboard
    1. kubectl apply -f kube-dashboard.yaml
    2. kubectl create -f kube-dashboard-admin.rbac.yaml
    3. 查看kubernete-dashboard-admin的token：
        kubectl -n kube-system get secret | grep kubernetes-dashboard-admin
        kubectl describe -n kube-system secret/kubernetes-dashboard-admin-token-5xgk2
          
    4. 修改dashboard访问方式为NodePort:修改type类型为NodePort
        kubectl -n kube-system edit service kubernetes-dashboard 
            
    5. 查看端口
        kubectl get services kubernetes-dashboard -n kube-system
        NAME                   TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)         AGE
        kubernetes-dashboard   NodePort   10.98.105.87   <none>        443:30269/TCP   8m
6. heapster 监控组建安装与使用
    