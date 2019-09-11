# openvpn

sudo $(pwd)/openvpn/bin/openvpn --config $(pwd)/openvpn/conf/openvpn.conf &  
sudo openvpn --config $HOME/openvpn/conf/openvpn.conf &  
sudo openvpn --config client0.ovpn &  

sysctl -w net.ipv4.ip_forward = 1 
sysctl -w net.ipv4.ip_nonlocal_bind = 1 
