# Stremio Install Scripts

A repository containing scripts that  are meant to install Stremio and its dependencies on systems that do not provide an official installation for Stremio.

## Install on Fedora 30

0. `sudo dnf install git` <-- Installs git so you can download my scripts
1. `git clone https://gitlab.com/alexandru-balan/stremio-install-scripts.git` <-- Downloads the script
2. `cd Stremio-Install-Scripts` <-- Moves into the downloaded folder
3. `chmod 755 installStremioFedora.sh` <-- Makes the script executable
4. `./installStremioFedora.sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)

## Install on Solus 4.0

0. `sudo eopkg it git` <-- Installs git so you can download my scripts
1. `git clone https://gitlab.com/alexandru-balan/stremio-install-scripts.git` <-- Downloads the script
2. `cd Stremio-Install-Scripts` <-- Moves into the downloaded folder
3. `chmod 755 installStremioSolus.sh` <-- Makes the script executable
4. `./installStremioSolus.sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)

## Install on Clear Linux (this one might take a lot to complete)

0. `sudo swupd bundle-add git` <-- Installs git so you can download my scripts (Probably already installed)
1. `git clone https://gitlab.com/alexandru-balan/stremio-install-scripts.git` <-- Downloads the script
2. `cd Stremio-Install-Scripts` <-- Moves into the downloaded folder
3. `chmod 755 installStremioClear.sh` <-- Makes the script executable
4. `./installStremioClear.sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)

## Install on Arch Linux

0. `sudo pacman -S git` <-- Installs git so you can download my scripts
1. `git clone https://gitlab.com/alexandru-balan/stremio-install-scripts.git` <-- Downloads the script
2. `cd Stremio-Install-Scripts` <-- Moves into the downloaded folder
3. `chmod 755 installStremioClear.sh` <-- Makes the script executable
4. `./installStremioArch.sh` <-- Installs Stremio (will ask for password to install dependencies and Stremio itself)
