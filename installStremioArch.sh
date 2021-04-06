# Installer for Stremio on Arch Linux
clear

# Downloading the dependencies
dep_install() {
    echo -e "\e[93m\e[40m------------------\e[0m"
    echo -e "\e[93m\e[40mInstalling Dependecies\e[0m"
    echo -e "\e[93m\e[40m------------------\e[0m"
    sleep 1s
    sudo pacman -S wget librsvg nodejs mpv openssl make gcc qt5-base qt5-webengine qt5-quickcontrols qt5-quickcontrols2
    if [ $? -ne 0 ]; then
        echo -e "\e[91m\e[40mWe could not install all dependencies. Please try again!\e[0m"
        read -n 1 -s -r -p "Press any key to continue"
        exit 1;
    fi
}

# Downloading Stremio
main_download() {
    echo -e "\e[93m\e[40m-------------------\e[0m"
    echo -e "\e[93m\e[40mDownloading Stremio\e[0m"
    echo -e "\e[93m\e[40m-------------------\e[0m"
    git clone --recurse-submodules --depth 1 --shallow-submodules https://github.com/Stremio/stremio-shell.git
    if [ $? -ne 0 ]; then
        echo -e "\e[91m\e[40mWe could not download Stremio. Check your internet connection and try again!\e[0m"
        read -n 1 -s -r -p "Press any key to continue"
        exit 1;
    fi
}

# Compiling and installing Stremio
compile_install() {
    echo -e "\e[93m\e[40m--------------------------------\e[0m"
    echo -e "\e[93m\e[40mCompiling and installing Stremio\e[0m"
    echo -e "\e[93m\e[40m--------------------------------\e[0m"
    qmake
    if [ $? -ne 0 ]; then
        echo -e "\e[91m\e[40mCan't set the project up. QMAKE error !\e[0m"
        read -n 1 -s -r -p "Press any key to continue"
        exit 1;
    fi
    make -f release.makefile
    if [ $? -ne 0 ]; then
        echo -e "\e[91m\e[40mCan't compile project. MAKE error !\e[0m"
        read -n 1 -s -r -p "Press any key to continue"
        exit 1;
    fi
    sudo make -f release.makefile install
    if [ $? -ne 0 ]; then
        echo -e "\e[91m\e[40mCan't install the project. MAKE error !\e[0m"
        read -n 1 -s -r -p "Press any key to continue"
        exit 1;
    fi
    sudo ./dist-utils/common/postinstall
}

dep_install
main_download
cd stremio-shell
compile_install

# Cleanup all the files
cd ..
rm -rf stremio-shell

echo DONE!!!
read -n 1 -s -r -p "Press any key to continue"
exit 0