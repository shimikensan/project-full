#!/bin/bash
# ---------------- Setup hệ thống -----------------
# Setup hostname
hostnamectl set-hostname master.com
hostnamectl set-hostname worker1.com
hostnamectl set-hostname worker2.com
# Setup file hosts
cat >>/etc/hosts<<EOF
  172.16.10.130 master.com
  172.16.10.129 worker1.com
  172.16.10.131 worker2.com
EOF
# Tat SELinux
setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# Tat Firewall
systemctl disable firewalld 
systemctl stop firewalld

# sysctl
cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

# Setup fowarding IPv4
sysctl -w net.ipv4.ip_forward=1

# Tắt swap
sed -i '/swap/d' /etc/fstab
swapoff -a

# ----------------------------- Cài đặt Docker -----------------------------------------
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum update -y && yum install docker-ce-18.06.2.ce -y
usermod -aG docker $(whoami)

# Create /etc/docker directory.
mkdir /etc/docker

# Setup daemon.
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF
# Reload lại systemd sau khi sửa
systemctl daemon-reload

# Start docker
systemctl start docker

# Khởi động docker cùng system
systemctl enable docker


# -------------- Cài đặt Kubernetes ----------------
# Add yum repo file for Kubernetes

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# Update server
yum -y update

# Download and setup kubelet
yum install -y kubeadm
# Start kubelet
systemctl start kubelet
# Khởi động kubelet cùng system
systemctl enable kubelet

# -------------- Cài đặt containerd -----------------
#Cai đặt containerd
yum -y install containerd
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

# Start containerd
systemctl enable containerd
systemctl start containerd

# ---------------Restart docker/kubelet/containerd -----------------
systemctl restart docker
systemctl restart kubelet
systemctl restart containerd



