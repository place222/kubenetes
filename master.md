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
kubeadm join 10.96.142.48:6443 --token 6up4cu.wvutd4tm5xuh4y19 --discovery-token-ca-cert-hash sha256:fc39135909193a1e8131e3f082d3d5b3f85b5483b1ee330732523d5db6912caa
token:
eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbi10b2tlbi1mc3pzYiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjRjYWE4Y2VmLTcwNmUtMTFlOC1hMGY4LTAwNTA1NjkwMzQ5YyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTprdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbiJ9.QzgtX9w01UprPUN0BV1h9uPzK7qk2soBKUMg1d-C2rxI8MtZIeJife6ILG_G4PAACwUtlYhaUmWrUfG45VQVAdKE96nNL1Sqz9ShxEKy4kaP-z9ivXNgWwzlklBeYpoSdzQXZ1qEHnnY8609RGZoDevXk132ioC543outI1MypGQXcECvH0jesdF6XcpVUmvWvr0Z7LqpAy0Iadbqe1kXTNUsF8z1IjdUa-QBRigH9X_L9vnWwiGEQ0uF6XzC3w4KyIISPPiHer51JRNJKhgJuU_eR2c7YfnuHuUjgc9RVY0J8zm4Mo2NxW2EtbwmvdD_O2VV_SLmFkCTuqNXyKctg
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