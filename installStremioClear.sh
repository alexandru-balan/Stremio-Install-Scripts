# Installer for Stremio on Clear Linux
clear
echo "####################################################"
echo "#WARNING: This will probably take a lot of time !!!#"
echo "####################################################"
sleep 3s
clear

# Downloading the dependencies
dep_install() {
    echo -e "\e[93m\e[40m------------------\e[0m"
    echo -e "\e[93m\e[40mInstalling Dependecies\e[0m"
    echo -e "\e[93m\e[40m------------------\e[0m"
    sleep 1s
    sudo swupd bundle-add nodejs-basic wget mpv qt-basic-dev devpkg-qtwebengine lib-qt5webengine c-basic
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

# Patching linking
ptching() {
    echo -e "\e[93m\e[40m----------------------\e[0m"
    echo -e "\e[93m\e[40mPatching mpv libraries\e[0m"
    echo -e "\e[93m\e[40m----------------------\e[0m"
    # Linking not needed anymore as the file name appears to be alright now by default
    sudo ln -s /usr/lib64/libmpv.so.1 /usr/lib64/libmpv.so
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
patching
compile_install

# Cleanup all the files
cd ..
rm -rf stremio-shell

echo DONE!!!
read -n 1 -s -r -p "Press any key to continue"
exit 0