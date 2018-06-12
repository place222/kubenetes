1. helm 的client
    1. wget https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz
    2. tar -zxvf helm-v2.9.1-linux-amd64.tar.gz
    3. mv linux-amd64/helm /usr/local/bin/helm 
    4. helm help
2. helm 的server tiller
    1. helm init --upgrade -i registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.9.1 --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
3. 增加权限
    1. 创建sa
        kubectl create serviceaccount --namespace kube-system tiller  
    1. 绑定cluster-admin规则
        kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller 
    1. 编辑deploy tiller-deploy
        kubectl edit deploy --namespace kube-system tiller-deploy
    1. 插入 serviceAccount:tiller
        serviceAccount: tiller