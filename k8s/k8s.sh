# 1. Cluster
# Create Cluster
kubeadm init --apiserver-advertise-address=192.168.56.100 --pod-network-cidr=192.168.0.0/16
# Start using your cluster:
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
# Setup network
curl https://docs.projectcalico.org/manifests/calico.yaml -O
kubectl apply -f calico.yaml
# IPv4 forwarding 
sysctl -w net.ipv4.ip_forward=1
# Show token join cluster
kubeadm token create --print-join-command
# Show info cluster
kubectl cluster-info
# Show config cluster
kubectl config view
# 2. Node
# Show list Node Cluster
kubectl get nodes
# Show detail info node
kubectl describe node name-node
# Show full info node
kubectl get node -o wide
# 3. Pod
# - Liệt kê các POD trong namespace hiện tại, thêm tham số -o wide hiện thị chi tiết hơn, 
# thêm -A hiện thị tất cả namespace, thêm -n namespacename hiện thị Pod của namespace namespacename
kubectl get pods
# - Xem cấu trúc mẫu định nghĩa POD trong file cấu hình yaml
kubectl explain pod --recursive=true
# - Triển khai tạo các tài nguyên định nghĩa trong file firstpod.yaml
kubectl apply -f firstpod.yaml
# - Xóa các tài nguyên tạo ra từ định nghĩa firstpod.yaml
kubectl delete -f firstpod.yaml
# - Lấy thông tin chi tiết POD có tên namepod, nếu POD trong namespace khác mặc định thêm vào tham số -n namespace-name
kubectl describe pod/namepod
# - Xem logs của POD có tên podname
kubectl logs pod/podname
# - Chạy lệnh từ container của POD có tên mypod, nếu POD có nhiều container thêm vào tham số -c và tên container
kubectl exec mypod command
# Chạy lệnh bash của container trong POD mypod và gắn terminal
kubectl exec -it mypod bash
# - Tạo server proxy truy cập đến các tài nguyên của Cluster. 
# http://localhost/api/v1/namespaces/default/pods/mypod:8085/proxy/, truy cập đến container có tên mypod trong namespace mặc định
kubectl proxy
# - Xóa POD có tên mypod
kubectl delete pod/mypod
# - Xem thông tin đầu đủ tất cả các thông tin của pod
kubectl get all -o wide
# - Xoá tất cả các pod
kubectl delete pod --all
