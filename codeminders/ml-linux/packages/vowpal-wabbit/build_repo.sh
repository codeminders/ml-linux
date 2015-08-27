#!/bin/bash
sudo apt-get install dh-make bzr-builddeb autotools-dev libboost-all-dev
mkdir ./vowpal-wabbit/
cd ./vowpal-wabbit/
wget https://github.com/JohnLangford/vowpal_wabbit/archive/8.0.tar.gz 
gunzip ./8.0.tar.gz
tar xvf ./8.0.tar
rm ./8.0.tar
mv ./vowpal_wabbit-8.0 ./vowpal-wabbit-8.0
cd ./vowpal-wabbit-8.0
./configure --prefix=/usr --with-boost-libdir=/usr/lib/x86_64-linux-gnu && make
dh_make -s --createorig
echo "override_dh_auto_configure:" >> ./debian/rules
echo "dh_auto_configure -- --prefix=/usr --with-boost-libdir=/usr/lib/x86_64-linux-gnu" >> ./debian/rules
dpkg-buildpackage -rfakeroot

