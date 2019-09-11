#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 10 September 2019,
# Description : Installing / Compiling OpenVPN from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make openssl-devel lzo-devel pam-devel

# openvpn downloading, extracting and compiling.
curl -JL https://swupdate.openvpn.org/community/releases/openvpn-2.4.7.tar.gz -o $HOME/openvpn.tar.gz && \
tar -xzf $HOME/openvpn.tar.gz -C $HOME                                                                && \
rm  -rf  $HOME/openvpn.tar.gz                                                                         && \
mv       $HOME/openvpn-* $HOME/OpenVPN                                                                && \
cd       $HOME/OpenVPN                                                                                && \
./configure --prefix=$HOME/openvpn --disable-lz4                                                      && \
make                                                                                                  && \
make install                                                                                          && \
cd       $HOME                                                                                        && \
rm  -rf  $HOME/OpenVPN                                                                                && \
echo "export PATH=$PATH:$HOME/openvpn/sbin" >> $HOME/.bashrc                                          && \
exec $BASH
