#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 10 September 2019,
# Description : Installing / Compiling LZO from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make

curl -JL http://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz -o $HOME/lzo.tar.gz && \
tar -xzf $HOME/lzo.tar.gz -C $HOME                                                            && \
rm  -rf  $HOME/lzo.tar.gz                                                                     && \
mv       $HOME/lzo-* $HOME/LZO                                                                && \
cd       $HOME/LZO                                                                            && \
./configure --prefix=$HOME/lzo                                                                   \
            --enable-shared                                                                      \
            --disable-static                                                                  && \
make                                                                                          && \
make install                                                                                  && \
cd       $HOME                                                                                && \
rm  -rf  $HOME/LZO                                                                            && \
rm  -rf  $HOME/lzo/share/doc
