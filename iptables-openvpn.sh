#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 29 April 2018,
# Description : Setting OpenVPN Server Firewall.

# Please run this script with sudo privileges.

# printing each command that is going to be executed.
set -x

# exit bash script if any one of the line execution fail.
set -e

# flushing all rules.
iptables -F

# accepting out going traffic. 
iptables -P OUTPUT ACCEPT

# iptables forwarding policy acceptance.
iptables -P FORWARD ACCEPT

# accept ssh connections from any ip.
iptables -A INPUT -m state --state NEW -p tcp --dport   22 -j ACCEPT

# accept openvpn connections from any ip.
iptables -A INPUT -m state --state NEW -p udp --dport 1194 -j ACCEPT

# routing traffic through openvpn server.
# 10.8.0.0, 10.8.1.0, ..., 10.8.255.0
<<comment
iptables -t nat -A POSTROUTING -s 10.8.0.0/24   -o eth0 -j MASQUERADE
comment
iptables -t nat -A POSTROUTING -s 172.17.2.0/24 -o eth0 -j MASQUERADE

# tracking connection.
# packets relationship to previous connections.
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# saving iptables rules.
service iptables save

# enabling kernel module tun.
modprobe tun

# appending tun module name to etc modules.
echo "tun" | tee -a /etc/modules

# enable ipv4 packet forwarding,
# note: reboot not required.
sysctl -w net.ipv4.ip_forward=1

# enable ipv4 packet forwarding,
# note: reboot required.
echo "net.ipv4.ip_forward=1" | tee -a /etc/sysctl.conf

# reloading system variables.
sysctl -p
