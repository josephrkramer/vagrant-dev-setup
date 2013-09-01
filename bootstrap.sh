#!/bin/bash

apt-get update
#apt-get install -y emacs23

#emacs24
apt-get install -y make libjpeg-dev libpng-dev libgif-dev libtiff-dev libncurses-dev
wget -c http://ftp.gnu.org/gnu/emacs/emacs-24.3.tar.gz
tar xfz emacs-24.3.tar.gz
cd emacs-24.3
./configure
make
make install

apt-get install -y git
apt-get install -y openjdk-7-jre-headless
