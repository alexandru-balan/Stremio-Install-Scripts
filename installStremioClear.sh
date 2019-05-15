# Installer for Stremio on Clear Linux
clear
echo "####################################################"
echo "#WARNING: This will probably take a lot of time !!!#"
echo "####################################################"
sleep 3s
clear

# Downloading the dependencies
echo "Installing Stremio"
echo "__________________"
sleep 1s
sudo swupd bundle-add git nodejs-basic wget mpv qt-basic-dev devpkg-qtwebengine lib-qt5webengine c-basic

# Downloading Stremio
echo "Downloading Stremio"
echo "___________________"
cd ~/Documents && mkdir github && cd github
git clone --recurse-submodules https://github.com/Stremio/stremio-shell.git
cd stremio-shell

# Patching linking 
echo "Patching mpv libraries"
echo "______________________"
sudo ln -s /usr/lib/libmpv.so.1 /usr/lib/libmpv.so

# Compiling and installing Stremio
echo "Compiling and installing stremio"
echo "________________________________"
qmake
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall

# Cleanup all the files
rm -rf ./*
cd .. && rmdir stremio-shell
cd .. && rmdir github


echo DONE!!!
