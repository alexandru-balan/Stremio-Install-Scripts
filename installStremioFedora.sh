# Stremio Installer for Fedora
clear
spec_file="$PWD/stremio.spec"
work_dir="$PWD/work"
rpm_dir="$PWD/RPMS"
download_dir="$PWD/stremio-shell"
# Installing dependencies
build_deps="nodejs wget librsvg2-devel librsvg2-tools mpv-libs-devel qt5-qtbase-devel qt5-qtwebengine-devel qt5-qtquickcontrols qt5-qtquickcontrols2 openssl-devel gcc make glibc-devel kernel-headers binutils rpmdevtools"
dep_check_and_install() {
    echo -e "\e[93m\e[40m------------------\e[0m"
    echo -e "\e[93m\e[40mChecking Dependecies\e[0m"
    echo -e "\e[93m\e[40m------------------\e[0m"

    for package in $build_deps
    do
        if ! rpm -q $package > /dev/null ; then
                missing_deps+=($package)
        fi
    done
    
    if [[ ${#missing_deps[@]} > 0 ]];
        then
            echo "${missing_deps[@]} missing"
            sudo dnf install ${missing_deps[@]}
            if [ $? -ne 0 ]; then
                echo -e "\e[91m\e[40mWe could not install all dependencies. Please try again!\e[0m"
                read -e -n 1 -s -r -p "Press any key to continue"
                exit 1;
            fi
        else
            echo "Dependencies are satisfied"
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
        read -e -n 1 -s -r -p "Press any key to continue"
        exit 1;
    fi
}

make_directories(){
    if [ ! -d "$work_dir" ]; then
        mkdir -p $work_dir
    fi

    if [ ! -d "$rpm_dir" ]; then
        mkdir -p $rpm_dir
    fi

    if [ -d "$PWD/stremio-shell" ]; then
        rm -rf stremio-shell
    fi
}

check_rpms_folder(){
    rpms="$(ls $rpm_dir/x86_64/Stremio-$1-* 2>/dev/null)"
    if [ $? -eq 0 ]; then
        while true; do
            read -p "RPM of the same version is found. Do you wish to install it? [Y/N]" yn
            case $yn in
                [Yy]* ) install_rpm $1; break;;
                [Nn]* ) break;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    fi
}

generate_rpm(){
    pkg_version=$(git rev-parse --short HEAD)
    check_rpms_folder $pkg_version
    rpmbuild -bb "$spec_file" --define "_topdir $work_dir" --define "downloaded_dir $download_dir" --define "_rpmdir $rpm_dir" --define "pkg_version $pkg_version"
    install_rpm $pkg_version
}

install_rpm(){
    sudo dnf install $rpm_dir/x86_64/Stremio-$1-*
    exit_script
}

exit_script(){
    cd ..
    rm -rf stremio-shell

    echo "DONE!"
    read -e -n 1 -s -r -p "Press any key to continue"
    exit 0
}

make_directories
dep_check_and_install
main_download
cd stremio-shell
generate_rpm




