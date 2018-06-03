
node节点，执行下面的命令：
    docker pull cnych/kube-proxy-amd64:v1.10.0  
    docker pull cnych/flannel:v0.10.0-amd64  
    docker pull cnych/pause-amd64:3.1  
    docker pull cnych/kubernetes-dashboard-amd64:v1.8.3  
    docker pull cnych/heapster-influxdb-amd64:v1.3.3  
    docker pull cnych/heapster-grafana-amd64:v4.4.3  
    docker pull cnych/heapster-amd64:v1.4.2  
    docker pull cnych/k8s-dns-kube-dns-amd64:1.14.8  
    docker pull cnych/k8s-dns-dnsmasq-nanny-amd64:1.14.8  
    docker pull cnych/k8s-dns-sidecar-amd64:1.14.8  
    
    docker tag cnych/flannel:v0.10.0-amd64 quay.io/coreos/flannel:v0.10.0-amd64  
    docker tag cnych/pause-amd64:3.1 k8s.gcr.io/pause-amd64:3.1  
    docker tag cnych/kube-proxy-amd64:v1.10.0 k8s.gcr.io/kube-proxy-amd64:v1.10.0  
    docker tag cnych/kubernetes-dashboard-amd64:v1.8.3 k8s.gcr.io/kubernetes-dashboard-amd64:v1.8.3  
    docker tag cnych/heapster-influxdb-amd64:v1.3.3 k8s.gcr.io/heapster-influxdb-amd64:v1.3.3  
    docker tag cnych/heapster-grafana-amd64:v4.4.3 k8s.gcr.io/heapster-grafana-amd64:v4.4.3  
    docker tag cnych/heapster-amd64:v1.4.2 k8s.gcr.io/heapster-amd64:v1.4.2  
    docker tag cnych/k8s-dns-kube-dns-amd64:1.14.8 k8s.gcr.io/k8s-dns-kube-dns-amd64:1.14.8  
    docker tag cnych/k8s-dns-dnsmasq-nanny-amd64:1.14.8 k8s.gcr.io/k8s-dns-dnsmasq-nanny-amd64:1.14.8  
    docker tag cnych/k8s-dns-sidecar-amd64:1.14.8 k8s.gcr.io/k8s-dns-sidecar-amd64:1.14.8  