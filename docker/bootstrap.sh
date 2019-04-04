#!/bin/bash
sudo yum update 
sudo yum install curl autoconf automake libtool pkgconfig git -y

git clone https://github.com/openvenues/libpostal
cd libpostal
sudo ./bootstrap.sh
sudo ./configure --libdir=/usr/local/lib64
sudo make -j4
sudo make install
sudo pip install postal
sudo ldconfig /usr/local/lib64
