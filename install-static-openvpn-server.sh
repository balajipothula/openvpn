#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 10 September 2019,
# Description : Installing / Compiling OpenVPN Server from Source Code.

# printing each command that is going to be executed.
set -x

# exit bash script if any one of the line execution fail.
set -e

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make iptables iptables-services openssl-devel lzo-devel pam-devel

# openvpn downloading, extracting and compiling.
curl -JL https://swupdate.openvpn.org/community/releases/openvpn-2.4.7.tar.gz -o $HOME/openvpn.tar.gz && \
tar -xzf $HOME/openvpn.tar.gz -C $HOME                                                                && \
rm  -rf  $HOME/openvpn.tar.gz                                                                         && \
mv       $HOME/openvpn-* $HOME/OpenVPN                                                                && \
cd       $HOME/OpenVPN                                                                                && \
./configure --prefix=$HOME/openvpn                                                                       \
            --sbindir=$HOME/openvpn/bin                                                                  \
            --disable-lz4                                                                                \
            --enable-static                                                                              \
            --disable-shared                                                                             \
            --disable-debug                                                                              \
            --disable-plugins                                                                         && \
make LIBS="-all-static"                                                                               && \
make install                                                                                          && \
cd       $HOME                                                                                        && \
rm  -rf  $HOME/OpenVPN                                                                                && \
rm  -rf  $HOME/openvpn/share/{doc,man}                                                                && \
echo "export PATH=$PATH:$HOME/openvpn/bin" >> $HOME/.bashrc                                           && \
exec $BASH
