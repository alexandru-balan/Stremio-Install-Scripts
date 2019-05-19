# Installer for Stremio on Arch Linux
clear

# Downloading the dependencies
echo "Installing Stremio"
echo "__________________"
sleep 1s
sudo pacman -S git wget librsvg nodejs mpv openssl make gcc qt5-base qt5-webengine qt5-quickcontrols qt5-quickcontrols2

# Downloading Stremio
echo "Downloading Stremio"
echo "___________________"
cd ~/Documents && mkdir github && cd github
git clone --recurse-submodules https://github.com/Stremio/stremio-shell.git
cd stremio-shell

# Compiling and installing Stremio
echo "Compiling and installing stremio"
echo "________________________________"
qmake
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall

# Cleanup all the files
rm -rf *
cd .. && rmdir stremio-shell
cd .. && rmdir github


echo DONE!!!
