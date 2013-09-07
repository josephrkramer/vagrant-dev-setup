#!/bin/bash

apt-get update

#emacs24
if [ ! `which emacs` ] ; then
    apt-get install -y make libjpeg-dev libpng-dev libgif-dev libtiff-dev libncurses-dev
    wget -c http://ftp.gnu.org/gnu/emacs/emacs-24.3.tar.gz
    tar xfz emacs-24.3.tar.gz
    cd emacs-24.3
    ./configure
    make
    make install
    cd ..
fi

#install and configure git
if [ ! `which git` ] ; then
    apt-get install -y git
    su - vagrant -c "git config --global user.name \"Joseph Kramer\""
    su - vagrant -c "git config --global user.email joseph.ryan.kramer@gmail.com"
    su - vagrant -c "git config --global core.editor emacs"
    su - vagrant -c "git config --global color.ui auto"
fi

#Java7 JDK
if [ ! `which java` ] ; then
    apt-get install -y openjdk-7-jdk
fi

#sbt for scala
if [ ! `which sbt` ] ; then
    apt-get install -y curl
    wget -c http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.0/sbt.deb
    dpkg -i sbt.deb
fi

#download emacs config
su - vagrant -c "wget -c https://raw.github.com/josephrkramer/emacs-config/master/.emacs"

#initialize dev repos
su - vagrant -c "git clone https://github.com/josephrkramer/akka-backprop.git"
