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
cd ..

#install and configure git
apt-get install -y git
su - vagrant -c "git config --global user.name \"Joseph Kramer\""
su - vagrant -c "git config --global user.email joseph.ryan.kramer@gmail.com"
su - vagrant -c "git config --global core.editor emacs"
su - vagrant -c "git config --global color.ui auto"

#Java7 JDK
apt-get install -y openjdk-7-jdk

#sbt for scala
apt-get install -y curl
wget -c http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.0/sbt.deb
dpkg -i sbt.deb

#download emacs config
wget -c https://raw.github.com/josephrkramer/emacs-config/master/.emacs
chown -R vagrant:vagrant .emacs

#initialize dev repos
git clone https://github.com/josephrkramer/akka-backprop.git
chown -R vagrant:vagrant akka-backprop
