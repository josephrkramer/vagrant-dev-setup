#!/bin/bash

apt-get update

#emacs24
apt-get install -y make libjpeg-dev libpng-dev libgif-dev libtiff-dev libncurses-dev
wget -c http://ftp.gnu.org/gnu/emacs/emacs-24.3.tar.gz
tar xfz emacs-24.3.tar.gz
cd emacs-24.3
./configure
make
make install

apt-get install -y git
git config --global user.name "Joseph Kramer"
git config --global user.email joseph.ryan.kramer@gmail.com
git config --global core.editor emacs
git config --global color.ui auto


apt-get install -y openjdk-7-jre-headless
