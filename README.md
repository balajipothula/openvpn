# openvpn

download openvpn server.  
curl -JOL https://raw.githubusercontent.com/balajipothula/openvpn/master/openvpnserver.tar.gz  

download openvpn client.  
curl -JOL https://raw.githubusercontent.com/balajipothula/openvpn/master/openvpnclient.tar.gz  

start openvpn server.  
sudo $(pwd)/openvpnserver/openvpn --config $(pwd)/openvpnserver/openvpn.conf &  

start openvpn client.  
sudo $(pwd)/openvpnclient/openvpn --config $(pwd)/openvpnclient/client.ovpn  &  

kill  openvpn service.  
ps -A | grep openvpn | awk '{print $1}' | xargs sudo kill

https://gist.github.com/Anubisss/afea82b97058e418e8030ee35e40f54f  
