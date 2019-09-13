# openvpn

start openvpn service.  
sudo $(pwd)/openvpnserver/openvpn --config $(pwd)/openvpnserver/openvpn.conf &  

kill  openvpn service.  
ps -A | grep openvpn | awk '{print $1}' | xargs sudo kill

curl -JOL https://raw.githubusercontent.com/balajipothula/openvpn/master/openvpn.tar.gz  

https://gist.github.com/Anubisss/afea82b97058e418e8030ee35e40f54f  
