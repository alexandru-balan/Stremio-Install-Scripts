# Installer for Stremio on Arch Linux
clear

# Downloading the dependencies
echo "------------------"
echo "Installing Stremio"
echo "------------------"
sleep 1s
sudo pacman -S wget librsvg nodejs mpv openssl make gcc qt5-base qt5-webengine qt5-quickcontrols qt5-quickcontrols2

# Downloading Stremio
echo "-------------------"
echo "Downloading Stremio"
echo "-------------------"
git clone --recurse-submodules https://github.com/Stremio/stremio-shell.git
cd stremio-shell

# Compiling and installing Stremio
echo "--------------------------------"
echo "Compiling and installing stremio"
echo "--------------------------------"
qmake
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall

# Cleanup all the files
cd ..
rm -rf stremio-shell

echo DONE!!!
