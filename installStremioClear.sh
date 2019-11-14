# Installer for Stremio on Clear Linux
clear
echo "####################################################"
echo "#WARNING: This will probably take a lot of time !!!#"
echo "####################################################"
sleep 3s
clear

# Downloading the dependencies
echo -e "\e[93m\e[40m------------------\e[0m"
echo -e "\e[93m\e[40mInstalling Dependencies\e[0m"
echo -e "\e[93m\e[40m------------------\e[0m"
sleep 1s
sudo swupd bundle-add nodejs-basic wget mpv qt-basic-dev devpkg-qtwebengine lib-qt5webengine c-basic

# Downloading Stremio
echo -e "\e[93m\e[40m-------------------\e[0m"
echo -e "\e[93m\e[40mDownloading Stremio\e[0m"
echo -e "\e[93m\e[40m-------------------\e[0m"
git clone --recurse-submodules https://github.com/Stremio/stremio-shell.git
cd stremio-shell

# Patching linking 
echo -e "\e[93m\e[40m----------------------\e[0m"
echo -e "\e[93m\e[40mPatching mpv libraries\e[0m"
echo -e "\e[93m\e[40m----------------------\e[0m"
# Linking no needed anymore as the file name appears to be alright now by default
sudo ln -s /usr/lib64/libmpv.so.1 /usr/lib64/libmpv.so

# Compiling and installing Stremio
echo -e "\e[93m\e[40m--------------------------------\e[0m"
echo -e "\e[93m\e[40mCompiling and installing Stremio\e[0m"
echo -e "\e[93m\e[40m--------------------------------\e[0m"
qmake
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall

# Cleanup all the files
cd ..
rm -rf stremio-shell

echo DONE!!!
