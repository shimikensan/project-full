# Tải xuống bản phát hành ổn định hiện tại của Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Cấp quyền thực thi cho file docker-compose
chmod +x /usr/local/bin/docker-compose
# Tạo liên kết tượng trưng
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose