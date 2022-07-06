# Ký tự đặc biệt:
# (*) biểu diễn cho một dãy các ký tự bất kỳ (tất cả)
# (?) biểu diễn một ký tự bất kỳ.
# ([]) đại diện cho tập các ký tự (hoặc hoặc)
# 1. System
# - Xem ngày giờ:
data
# - Chuyển thư mục:
cd 
# - Hiển thị Nội dung thư mục:
ls
# - Xoá toàn bộ thư mục:
rm -r 
# - Tra cứu lệnh:
man 
# - Xem lịch sử command
history 
# - Đặt bí danh cho lệnh: alias list=ls 
alias
# - Xem thư mục đang đứng hiện tại:
pwd
# - Tạo Thư mục:
mkdir
# - Sao chép file: 
cp 
# - Di chuyển file:
mv 
# - Đọc file: 
cat
# - Tìm kiếm file: (find / -name bien.txt) , thư mục (find / -type d )
find
# - Ghép nối thiết bị vào cây thư mục:
mount 
# - Tách thiết bị khỏi cây thư mục: 
umout
# - Lưu trữ và nén file
# - Đóng gói:
tar -cvf file.tar /home/biennv
# - Đóng gói và nén: 
tar -cvzf file.tar.gz /home/biennv
# - Mở gói:
tar -xvf file.tar 
# - Giải nén:
tar -zxvf file.tar.gz 
# - Hiển thị nội dung file tar:
tar -tvf file.tar 
# - Hẹn giờ thực hiện: 
at
# 2. Port
# 3. Network
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
# 4. Security