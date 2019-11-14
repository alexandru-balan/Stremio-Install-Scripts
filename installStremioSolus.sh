# Stremio Installer for Solus 4.0
clear
echo -e "\e[93m\e[40m-----------------------\e[0m"
echo -e "\e[93m\e[40mInstalling Dependencies\e[0m"
echo -e "\e[93m\e[40m-----------------------\e[0m"
sleep 1s
sudo eopkg it nodejs wget mpv-libs-devel make qt5-base-devel qt5-webengine-devel qt5-quickcontrols qt5-quickcontrols2 openssl-devel librsvg-devel gcc g++ glibc-devel binutils libtool-devel linux-headers
echo -e "\e[93m\e[40m-------------------\e[0m"
echo -e "\e[93m\e[40mDownloading Stremio\e[0m"
echo -e "\e[93m\e[40m-------------------\e[0m"
sleep 1s
git clone --recursive https://github.com/Stremio/stremio-shell.git
cd stremio-shell
echo -e "\e[93m\e[40m--------------------------------\e[0m"
echo -e "\e[93m\e[40mCompiling and installing Stremio\e[0m"
echo -e "\e[93m\e[40m--------------------------------\e[0m"
sleep 1
qmake
make -f release.makefile
sudo make -f release.makefile install
sudo ./dist-utils/common/postinstall

# Cleaning up
cd ..
rm -rf stremio-shell

echo "DONE!"
