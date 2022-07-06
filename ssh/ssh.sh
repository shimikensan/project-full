# Path save public key trên server
# User root: /root/.ssh/authorized_keys
# User common: /home/user/.ssh/authorized_keys
# Cấu hình private key trên client
# vi /root/.ssh/config
Host ip_server
User root
Port 22
PreferredAuthentications publickey
IdentityFile "/path/id_rsa"
# create ssh-key
ssh-keygen -t rsa

