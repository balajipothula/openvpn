#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 29 August 2019,
# Description : Installing / Compiling OpenSSL from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make perl readline-devel zlib zlib-devel

# openssl downloading, extracting and compiling.
curl -J -L https://www.openssl.org/source/openssl-1.0.2s.tar.gz -o $HOME/openssl.tar.gz && \
tar -xzf $HOME/openssl.tar.gz -C $HOME                                                  && \
rm  -rf  $HOME/openssl.tar.gz                                                           && \
mv       $HOME/openssl-* $HOME/OpenSSL                                                  && \
cd       $HOME/OpenSSL                                                                  && \
./config --prefix=$HOME/openssl --openssldir=$HOME/openssl shared zlib                  && \
make install                                                                            && \
cd       $HOME                                                                          && \
rm  -rf  $HOME/OpenSSL                                                                  && \
echo "export PATH=$PATH:$HOME/openssl/bin" >> $HOME/.bashrc                             && \
exec $BASH
