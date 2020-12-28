# Stremio appears to now support builds for major distros so I advise you to download the official builds [here](https://www.stremio.com/downloads/?utm_source=blog&utm_medium=sidebar%20widgets) if you are using Fedora or an Arch system

# Stremio Install Scripts

A repository containing scripts that  are meant to install Stremio and its dependencies on systems that do not provide an official installation for Stremio.

# Disclaimer:

You probably need the proprietary media codecs in order to be able to play any online content with stremio, so before running the script I advise you to search for how to install them on your **speciffic distribution** as the setps may vary.

**Solus users:** you have the codecs preinstalled out of the box.

**Fedora users:** you shoud see how to install rpmfusion repos (both free and non-free) then install all the codecs through the software center. **RPMFUSION Free is required for mpv media player libs which are a dependency for Stremio**

**Arch users:** if not already installed, then you shoud probably install gstreamer and ffmpeg

**Clear Linux users:** https://community.clearlinux.org/t/how-to-h264-etc-support-for-firefox-including-ffmpeg-install/195

## Install on Fedora 31

`curl -fsSL https://raw.githubusercontent.com/alexandru-balan/Stremio-Install-Scripts/master/installStremioFedora.sh | sh`  <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)


## Install on Solus 4.1

`curl -fsSL https://raw.githubusercontent.com/alexandru-balan/Stremio-Install-Scripts/master/installStremioSolus.sh | sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)

## Install on Clear Linux (this one might take a lot to complete)
*Clear linux installs a lot of other things beside the necessary deps (around 2GB worth of bundles) due to the way swupd works*

`curl -fsSL https://raw.githubusercontent.com/alexandru-balan/Stremio-Install-Scripts/master/installStremioClear.sh | sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)

## Install on Arch Linux

`curl -fsSL https://raw.githubusercontent.com/alexandru-balan/Stremio-Install-Scripts/master/installStremioArch.sh | sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)
