# Stremio Installer for Fedora 30
clear

# Installing dependencies
dep_install() {
    echo -e "\e[93m\e[40m------------------\e[0m"
    echo -e "\e[93m\e[40mInstalling Dependecies\e[0m"
    echo -e "\e[93m\e[40m------------------\e[0m"
    sleep 1s
    sudo dnf install nodejs wget librsvg2-devel librsvg2-tools mpv-libs-devel qt5-qtbase-devel qt5-qtwebengine-devel qt5-qtquickcontrols qt5-qtquickcontrols2 openssl-devel gcc g++ make glibc-devel kernel-headers binutils -y
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
    git clone --recurse-submodules https://github.com/Stremio/stremio-shell.git
    if [ $? -ne 0 ]; then
        echo -e "\e[91m\e[40mWe could not download Stremio. Check your internet connection and try again!\e[0m"
        read -n 1 -s -r -p "Press any key to continue"
        exit 1;
    fi
}

# Patching release file so it uses qmake-qt5 because qmake is not recognized in fedora
patching() {
    echo -e "\e[93m\e[40m--------------\e[0m"
    echo -e "\e[93m\e[40mPatching files\e[0m"
    echo -e "\e[93m\e[40m--------------\e[0m"
    sed -i 's/qmake/qmake-qt5/g' release.makefile
}

# Compiling and installing Stremio
compile_install() {
    echo -e "\e[93m\e[40m--------------------------------\e[0m"
    echo -e "\e[93m\e[40mCompiling and installing Stremio\e[0m"
    echo -e "\e[93m\e[40m--------------------------------\e[0m"
    qmake-qt5
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
patching
compile_install

# Cleaning up
cd ..
rm -rf stremio-shell

echo "DONE!"
read -n 1 -s -r -p "Press any key to continue"
exit 0
