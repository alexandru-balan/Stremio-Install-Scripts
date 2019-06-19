# Installer for Stremio on Clear Linux
clear
echo "####################################################"
echo "#WARNING: This will probably take a lot of time !!!#"
echo "####################################################"
sleep 3s
clear

# Downloading the dependencies
echo "------------------"
echo "Installing Stremio"
echo "------------------"
sleep 1s
sudo swupd bundle-add git nodejs-basic wget mpv qt-basic-dev devpkg-qtwebengine lib-qt5webengine c-basic

# Downloading Stremio
echo "-------------------"
echo "Downloading Stremio"
echo "-------------------"
git clone --recurse-submodules https://github.com/Stremio/stremio-shell.git
cd stremio-shell

# Patching linking 
echo "----------------------"
echo "Patching mpv libraries"
echo "----------------------"
# Linking no needed anymore as the file name appears to be alright now by default
sudo ln -s /usr/lib64/libmpv.so.1 /usr/lib64/libmpv.so

# Compiling and installing Stremio
echo "--------------------------------"
echo "Compiling and installing stremio"
echo "--------------------------------"
qmake
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall

# Cleanup all the files
rm -rf *
rm -rf .*
cd .. && rmdir stremio-shell


echo DONE!!!
