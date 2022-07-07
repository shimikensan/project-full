
base=https://github.com/docker/machine/releases/download/v0.16.0
# Download docker-machine
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
# Di chuyển docker-machine đến thư mục bin để thực thi lệnh docker-machine
mv docker-machine /usr/bin
# Cấp quyền thực thi cho docker-machine
chmod +x /usr/bin/docker-machine
# Xem version docker-machine
docker-machine --version