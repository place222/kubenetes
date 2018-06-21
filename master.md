2. 初始化集群
    1.命令
        ! 切记一定要把master ip 的地址写上apiserver-cert-extra-sans上做ca证书
        kubeadm init --kubernetes-version=v1.10.0 --pod-network-cidr=10.244.0.0/16  --apiserver-cert-extra-sans=47.105.54.159

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

kubeadm join 172.31.237.194:6443 --token 4yjd9k.9vj9czu9scpupfjr --discovery-token-ca-cert-hash sha256:a4773305a698a4e9737e63991c514fc38cb90d05b8abf20a55c93835ada9b18b

#公司48master
kubeadm join 10.96.142.48:6443 --token 3og8ql.xkhyjow9vhftreor --discovery-token-ca-cert-hash sha256:dc9908b13f282fd7be120b07778e4590ee843ecad9a574daddc0c6f6944353e4
token:
eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbi10b2tlbi1jbGRmNSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjY5OGNlZGYyLTczNjUtMTFlOC04ZWM0LTAwNTA1NjkwMzQ5YyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTprdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbiJ9.Ois7LpmUz9DKPBYTXk3kQTwAls25P4mpFXa3p6t9NbRc2LxJk-43KolbJEDAZrFYvDwlix1bdOIl14kOJjoTng4N3okzoCqXM3S_c1AIoAcMUs5IXJU0UxIilyf5L-XYA0xiBUrkGWUdnExSP7iN0Ro-EpJM8OHpniGmb3aEuf8hncuo7F22VVDmz4UgF5mcf7zwGzS40makOPJbN0SdvZbFa05QAtrW2SZIcaD4x7ivKYM32gl0wpOrAb_sbn_x0GnaKBzNf4Poi-Fbq0d3GoqJJyVqoXE_G7M5cj9P8I7NOA8trXJGK6Kewuv96m6mYGjD_Z0EwOtfq2njMhTXTQ
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5. 设置完node节点后 可以加入dashboard
    1. 具体查看 resources/dashboard
6. heapster 监控组建安装与使用
    1. 具体查看resources/heapster
7. 安装ingress-nginx
    1. 具体查看resources/ingress-nginx
8. 安装helm
    1. 这个是一个编排包管理的工具
    2. 具体查看resources/helm