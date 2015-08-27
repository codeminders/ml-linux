#!/bin/bash
sudo apt-get install dh-make bzr-builddeb autotools-dev libboost-all-dev
mkdir ./vowpal-wabbit/
cd ./vowpal-wabbit/
wget https://github.com/JohnLangford/vowpal_wabbit/archive/8.0.tar.gz 
bzr whoami "ML_distro_team <ml@codeminders.com>"
bzr dh-make vowpal-wabbit 8.0 8.0.tar.gz
echo "override_dh_auto_configure:" >> ./vowpal-wabbit/debian/rules
echo "dh_auto_configure -- --prefix=/usr --with-boost-libdir=/usr/lib/x86_64-linux-gnu" >> ./vowpal-wabbit/debian/rules
cd ./vowpal-wabbit/debian
rm *ex *EX
bzr add debian/source/format
bzr commit -m "Initial commit of Debian packaging."
bzr builddeb -- -us -uc

