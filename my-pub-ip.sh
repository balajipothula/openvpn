#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 13 June 2018,
# Description : What is my public IP address.

# what is my public ip address.
dig +short myip.opendns.com @resolver1.opendns.com
 
# what is my public ip address.
#dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/"//g'

# what is my public ip address.
#host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}'
