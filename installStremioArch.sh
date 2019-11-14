# Installer for Stremio on Arch Linux
clear

# Downloading the dependencies
echo -e "\e[93m\e[40m------------------\e[0m"
echo -e "\e[93m\e[40mInstalling Dependecies\e[0m"
echo -e "\e[93m\e[40m------------------\e[0m"
sleep 1s
sudo pacman -S wget librsvg nodejs mpv openssl make gcc qt5-base qt5-webengine qt5-quickcontrols qt5-quickcontrols2

# Downloading Stremio
echo -e "\e[93m\e[40m-------------------\e[0m"
echo -e "\e[93m\e[40mDownloading Stremio\e[0m"
echo -e "\e[93m\e[40m-------------------\e[0m"
git clone --recurse-submodules https://github.com/Stremio/stremio-shell.git
cd stremio-shell

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
