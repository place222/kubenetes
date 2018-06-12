1. 修改路由
sudo tee /etc/sysctl.d/k8s.conf <<-'EOF'
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    net.ipv4.ip_forward = 1
EOF
sudo modprobe br_netfilter
sudo sysctl -p /etc/sysctl.d/k8s.conf

2.安装kubelet kubeadm kubectl
 1.安装必要组件
    apt-get update && apt-get install -y apt-transport-https  
 2.设置kubenetes源
    curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -  
 3. 添加镜像
sudo tee /etc/apt/sources.list.d/kubernetes.list <<-'EOF'
    deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF
 4.更新安装
	apt-get update
	apt-get install -y kubelet kubeadm kubectl  
 5.修改k8s配置文件：vim /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    1.修改为cgroupfs，与docker匹配
        Environment="KUBELET_CGROUP_ARGS=--cgroup-driver=cgroupfs"
    2.关闭swap：
        Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"
    3. ARGS $KUBELET_CGROUP_ARGS $KUBELET_EXTRA_ARGS
 6.设置kubelet自启动，并启动kubelet  
	systemctl enable kubelet && systemctl start kubelet  