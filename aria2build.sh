#!/bin/bash
echo -e "\r" | add-apt-repository ppa:jonathonf/ffmpeg-3
apt update && apt install ffmpeg aria2 -y
wget https://raw.githubusercontent.com/maidonghu/myaria2/master/aria2_1.31.0-1_amd64.deb
dpkg -i aria2_1.31.0-1_amd64.deb
cd /mnt/volume-nyc1-01
mkdir -p Downloads
cd Downloads
touch aria2.log
touch aria2.session
cd ~
wget https://raw.githubusercontent.com/maidonghu/myaria2/master/aria2.conf
mv aria2.conf /usr/local/etc/aria2.conf
aria2c --conf-path=/usr/local/etc/aria2.conf

#git clone https://github.com/aria2/aria2.git
#apt install libgnutls-dev nettle-dev libgmp-dev libssh2-1-dev libc-ares-dev libxml2-dev zlib1g-dev libsqlite3-dev pkg-config
#apt install libcppunit-dev autoconf automake autotools-dev autopoint libtool
#cd aria2/
#autoreconf -i
#./configure
#make -j8
#checkinstall
#make install
#make clean
#make distclean
#cd ..

apt install megatools -y

apt install golang-go -y
echo export GOPATH=/root/gocode | tee -a ./.profile
source ./.profile
echo export PATH=$PATH:$GOPATH/bin | tee -a ./.profile
source ./.profile
go get github.com/prasmussen/gdrive
wget https://raw.githubusercontent.com/maidonghu/myaria2/master/token_v2.json
mkdir .gdrive
mv token_v2.json .gdrive/token_v2.json
