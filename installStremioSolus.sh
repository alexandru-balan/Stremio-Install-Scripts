#!/bin/bash
clear
echo Installing Dependencies
echo -----------------------
sleep 1s
sudo eopkg it git nodejs wget mpv-libs-devel make qt5-base-devel qt5-webengine-devel qt5-quickcontrols qt5-quickcontrols2 openssl-devel librsvg-devel gcc g++ glibc-devel binutils libtool-devel linux-headers
cd ~/Documents && mkdir github && cd github
echo Downloading Stremio
echo -------------------
sleep 1s
git clone --recursive https://github.com/Stremio/stremio-shell.git
cd stremio-shell
echo Installing Stremio
echo ------------------
sleep 1
qmake
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall
echo DONE
