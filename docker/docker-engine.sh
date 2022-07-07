# Cập nhật hệ thống server
yum -y update
# Gỡ cài đặt các phiên bản cũ
yum remove docker docker-common docker-selinux docker-engine
# Cài đặt các gói cần thiết
yum -y install yum-utils device-mapper-persistent-data lvm2
# Config docker-ce repo
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# Cài đặt docker-ce
yum -y install docker-ce
# Thêm user vào group docker
usermod -aG docker $(whoami)
# Start docker
systemctl start docker
# Khởi động docker cùng hệ thống
systemctl enable docker
# Xem trạng thái docker
systemctl status docker
# Kiểm tra version docker
docker --version


# ------------ Một số lệnh Docker -------------
# Kiểm tra thông tin hệ thống
docker info
# Liệt kê các images
docker images -a
# Tải về một image từ hub.docker.com
docker pull nameimage:tag
# Liệt kê các container đang chạy
docker ps
# Liệt kê các container
docker ps -a
docker container ls -a
# Tạo / chạy container
docker run -it --name nameyourcontainer -h "nameyourhost" image_id
# (Tạo, chạy một container từ image với id (name) là image_id
#Một số tham số thêm vào khi tạo container:
-v path-in-host:path-in-container (Ánh xạ thư mục máy host vào container)
--volumes-from other-container-name (Nhận chia sẻ thư mục đã ánh xạ từ container khác)
-p public-port:target-port (Container có cổng ngoài public-port ánh xạ vào cổng trong target-port)
--restart=always (Thiết lập để Docker tự khởi động container)
# Vào terminal container đang chạy
docker container attach containerid
# Chạy một lệnh command trên container đang hoạt động 
docker exec -it containerid command 
# Dừng hoạt động một container
docker stop containerid
# Chạy một container
docker start -i containerid
# Khởi động lại container
docker restart containerid
# Xóa container
docker rm containerid
# Thoát -it terminal nhưng container vẫn chạy
CTRL +P, CTRL + Q
# Lưu một container đang dừng thành Image
docker commit containerid imagename:imageversion
# Lưu image ra đĩa
docker save --output myimage.tar myimage_id
# Nạp Image trên đĩa vào Docker
docker load -i myimage.tar
# Đổi tên Image
docker tag image_id imagename:version
# Liệt kê các network
docker network ls
# Tạo mạng kiểu bridge đặt tên là name-network
docker network create --driver bridge name-network
# Nối container vào mạng name-network
docker network connect name-network name-container
# Lấy thông tin về image hoặc container
docker inspect name_or_id_of_image_container
# Lấy thông lịch sử tạo thành iamge
docker history name_or_id_of_image
# Theo dõi thay đổi các file trên container
docker diff container-name-or-id
# Đọc log container
docker logs -f container-name-or-id
# Đo lường thông tin
docker stats container-name-or-id
