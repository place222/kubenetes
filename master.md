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
        kubeadm init --kubernetes-version=v1.10.0 --pod-network-cidr=10.244.0.0/16
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
    1. 使用kube-flannel.yml文件
        1. 启动flannel：kubectl apply -f  kube-flannel.yml
        2. kubectl get pods --all-namespaces查看状态：

4. 拷贝这个joinkey到node节点 开始设置node节点
    kubeadm join 10.96.142.48:6443 --token iqxnlm.3lupxkk8rwn12e5o --discovery-token-ca-cert-hash sha256:c958bc5df52a88f8c1fc9a83ce2e70b45a51bad3fad71b168f4348a82fb406c2

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5. 设置完node节点后 可以加入dashboard
    1. kubectl apply -f kube-dashboard.yaml
    2. kubectl create -f kube-dashboard-admin.rbac.yaml
    3. 查看kubernete-dashboard-admin的token：
        kubectl -n kube-system get secret | grep kubernetes-dashboard-admin
        kubectl describe -n kube-system secret/kubernetes-dashboard-admin-token-5xgk2
            Name:         kubernetes-dashboard-admin-token-5xgk2
            Namespace:    kube-system
            Labels:       <none>
            Annotations:  kubernetes.io/service-account.name=kubernetes-dashboard-admin
                        kubernetes.io/service-account.uid=b4b193f1-6628-11e8-8828-00505690349c

            Type:  kubernetes.io/service-account-token

            Data
            ====
            ca.crt:     1025 bytes
            namespace:  11 bytes
            token:      eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbi10b2tlbi01eGdrMiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImI0YjE5M2YxLTY2MjgtMTFlOC04ODI4LTAwNTA1NjkwMzQ5YyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTprdWJlcm5ldGVzLWRhc2hib2FyZC1hZG1pbiJ9.OK96ezrd2DWw1CSDxO4YISzfs5fmtJ6R9AcfQmKplL7q2xR8lFnDoBf5MLt1c5iTG5zGdy8o-7EwO4h0WvM3Vv3ve5QcE2-Tlke2SfEKOYJFvHLZJeohyVts_0OF1agdBvDjR0LGNazvXFF9y6gryK_TaiEJYnTJEJtFFcj0VoQI2xeUc2GwJdu7sCgfOSvASOQGQxaMs-2_7zMtUh4MgjLGR7j4r5CexIFRLodFrboMo0kXo63mDhaJxZ7Y2F8U7LgteuwZRtji4-pmU3niGHMPyc61VHwT8eTHkCoeG4evnvmxj_tj7yZXM_rRcE-7yqmGVj33Ten1MgZgVgn8Og
            root@vmlin0545:~# 
    4. 修改dashboard访问方式为NodePort:修改type类型为NodePort
        kubectl -n kube-system edit service kubernetes-dashboard 
            apiVersion: v1
            kind: Service
            metadata:
            annotations:
                kubectl.kubernetes.io/last-applied-configuration: |
                {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"labels":{"k8s-app":"kubernetes-dashboard"},"name":"kubernetes-dashboard","namespace":"kube-system"},"spec":{"ports":[{"port":443,"targetPort":8443}],"selector":{"k8s-app":"kubernetes-dashboard"}}}
            creationTimestamp: 2018-06-02T05:48:41Z
            labels:
                k8s-app: kubernetes-dashboard
            name: kubernetes-dashboard
            namespace: kube-system
            resourceVersion: "4395"
            selfLink: /api/v1/namespaces/kube-system/services/kubernetes-dashboard
            uid: 9a96eec2-6628-11e8-8828-00505690349c
            spec:
            clusterIP: 10.98.105.87
            externalTrafficPolicy: Cluster
            ports:
            - nodePort: 30269
                port: 443
                protocol: TCP
                targetPort: 8443
            selector:
                k8s-app: kubernetes-dashboard
            sessionAffinity: None
            type: NodePort
            status:
            loadBalancer: {}
    5. 查看端口
        kubectl get services kubernetes-dashboard -n kube-system
        NAME                   TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)         AGE
        kubernetes-dashboard   NodePort   10.98.105.87   <none>        443:30269/TCP   8m
6. heapster 监控组建安装与使用
    