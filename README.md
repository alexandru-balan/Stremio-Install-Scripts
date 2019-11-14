# The devlopment on this repo will continue as usually

# Stremio Install Scripts

A repository containing scripts that  are meant to install Stremio and its dependencies on systems that do not provide an official installation for Stremio.

# Disclaimer:

You probably need the proprietary media codecs in order to be able to play any online content with stremio, so before running the script I advise you to search for how to install them on your **speciffic distribution** as the setps may vary.

**Solus users:** you have the codecs preinstalled out of the box.

**Fedora users:** you shoud see how to install rpmfusion repos (both free and non-free) then install all the codecs through the software center. **RPMFUSION Free is required for mpv media player libs which are a dependency for Stremio**

**Arch users:** if not already installed, then you shoud probably install gstreamer and ffmpeg

**Clear Linux users:** https://community.clearlinux.org/t/how-to-h264-etc-support-for-firefox-including-ffmpeg-install/195

## Install on Fedora 30

0. `sudo dnf install git` <-- Installs git so you can download my scripts
1. `git clone https://github.com/alexandru-balan/Stremio-Install-Scripts.git` <-- Downloads the script
2. `cd Stremio-Install-Scripts` <-- Moves into the downloaded folder
3. `chmod 755 installStremioFedora.sh` <-- Makes the script executable
4. `./installStremioFedora.sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)

## Install on Solus 4.0

0. `sudo eopkg it git` <-- Installs git so you can download my scripts
1. `git clone https://github.com/alexandru-balan/Stremio-Install-Scripts.git` <-- Downloads the script
2. `cd Stremio-Install-Scripts` <-- Moves into the downloaded folder
3. `chmod 755 installStremioSolus.sh` <-- Makes the script executable
4. `./installStremioSolus.sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)

## Install on Clear Linux (this one might take a lot to complete)
*Clear linux installs a lot of other things beside the necessary deps (around 2GB worth of bundles) due to the way swupd works*

0. `sudo swupd bundle-add git` <-- Installs git so you can download my scripts (Probably already installed)
1. `git clone https://github.com/alexandru-balan/Stremio-Install-Scripts.git` <-- Downloads the script
2. `cd Stremio-Install-Scripts` <-- Moves into the downloaded folder
3. `chmod 755 installStremioClear.sh` <-- Makes the script executable
4. `./installStremioClear.sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)

## Install on Arch Linux

0. `sudo pacman -S git` <-- Installs git so you can download my scripts
1. `git clone https://github.com/alexandru-balan/Stremio-Install-Scripts.git` <-- Downloads the script
2. `cd Stremio-Install-Scripts` <-- Moves into the downloaded folder
3. `chmod 755 installStremioArch.sh` <-- Makes the script executable
4. `./installStremioArch.sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)
