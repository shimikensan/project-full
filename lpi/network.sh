# ---------- Network -------------------
# - Xem tất cả cài đặt các giao diện mạng:
ifconfig -a
# - Disalbe Card Network:
ifdown ens33
# - Enabled Card Network:
ifup ens33
# - Gán IP, Netmask và Broadcast cho giao diện mạng:
ifconfig eth0 172.16.25.125 netmask 255.255.255.0 broadcast 172.16.25.66
# - Thay đổi MTU cho giao diện mạng: 
ifconfig eth0 mtu 1000
# - Tắt chế độ Promiscuous 
ifconfig eth0 -promisc 
# - Xoá bí danh khỏi giao diện mạng: 
ifconfig eth0: 0 down
# - Thay đổi địa chỉ MAC
ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF
# Disabled IPv6
cat >>/etc/sysctl.conf<<EOF
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF
sysctl -p