#!/bin/bash
clear
echo Installing Dependencies
echo -----------------------
sleep 1s
sudo dnf install git nodejs wget librsvg2-devel librsvg2-tools mpv-libs-devel qt5-qtbase-devel qt5-qtwebengine-devel qt5-qtquickcontrols qt5-qtquickcontrols2 openssl-devel gcc g++ make glibc-devel kernel-headers binutils -y
cd ~/Documents/
mkdir github && cd github
echo Getting Stremio from the web
echo ----------------------------
sleep 1s
git clone --recursive https://github.com/Stremio/stremio-shell.git
cd stremio-shell
sed -i 's/qmake/qmake-qt5/g' release.makefile
echo Compiling and Installing Stremio to your system
echo -----------------------------------------------
qmake-qt5
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall
echo DONE!
