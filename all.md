1.添加镜像 
    创建/etc/sysctl.d/k8s.conf文件，添加如下内容：
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    net.ipv4.ip_forward = 1
    执行如下命令使修改生效：

    $ modprobe br_netfilter
    $ sysctl -p /etc/sysctl.d/k8s.conf

2.安装kubelet kubeadm kubectl
 1.安装必要组件
    apt-get update && apt-get install -y apt-transport-https  
 2.设置kubenetes源
    curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -  
 3. 添加镜像
    /etc/apt/sources.list.d/kubernetes.list   
	deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main  
 4.更新安装
	apt-get update
	apt-get install -y kubelet kubeadm kubectl  
 5.修改k8s配置文件：vim /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    1.修改为cgroupfs，与docker匹配
        Environment="KUBELET_CGROUP_ARGS=--cgroup-driver=cgroupfs"
    2.关闭swap：
        Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"
 6.设置kubelet自启动，并启动kubelet  
	systemctl enable kubelet && systemctl start kubelet  