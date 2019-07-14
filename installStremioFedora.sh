#! /bin/bash

# Stremio Installer for Fedora 30
clear
echo "-----------------------"
echo "Installing Dependencies"
echo "-----------------------"
sleep 1s
sudo dnf install nodejs wget librsvg2-devel librsvg2-tools mpv-libs-devel qt5-qtbase-devel qt5-qtwebengine-devel qt5-qtquickcontrols qt5-qtquickcontrols2 openssl-devel gcc g++ make glibc-devel kernel-headers binutils -y
echo "----------------------------"
echo "Getting Stremio from the web"
echo "----------------------------"
sleep 1s
git clone --recursive https://github.com/Stremio/stremio-shell.git
cd stremio-shell

# Ptching release file so it uses qmake-qt5 because qmake is not recognized in fedora
echo "--------------"
echo "Patching files"
echo "--------------"
sed -i 's/qmake/qmake-qt5/g' release.makefile

echo "-----------------------------------------------"
echo "Compiling and Installing Stremio to your system"
echo "-----------------------------------------------"
qmake-qt5
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall

# Cleaning up
cd ..
rm -rf stremio-shell

echo "DONE!"
