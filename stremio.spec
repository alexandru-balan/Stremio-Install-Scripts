
Name: Stremio           
Version: %{pkg_version}       
Release: 1%{?dist}
Summary: Streaming shows and movies      

License: GPLv3       
URL: https://github.com/Stremio/stremio-shell           
Source0:  https://github.com/Stremio/stremio-shell      

BuildRequires: nodejs
BuildRequires: wget
BuildRequires: librsvg2-devel
BuildRequires: librsvg2-tools
BuildRequires: mpv-libs-devel
BuildRequires: qt5-qtbase-devel
BuildRequires: qt5-qtwebengine-devel
BuildRequires: qt5-qtquickcontrols
BuildRequires: qt5-qtquickcontrols2
BuildRequires: openssl-devel
BuildRequires: gcc
BuildRequires: g++
BuildRequires: make
BuildRequires: glibc-devel
BuildRequires: kernel-headers
BuildRequires: binutils


Requires: qt5-qtbase-devel%{?_isa}       

%description
The Next Generation Media Center

%prep



%build
cd %{downloaded_dir}
%{qmake_qt5}
make -f release.makefile


%install
rm -rf $RPM_BUILD_ROOT
cd %{downloaded_dir}

PREFIX=%{buildroot} make -f release.makefile install DESTDIR=%{buildroot}
mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/bin
touch %{buildroot}/usr/share/applications/smartcode-stremio.desktop
touch %{buildroot}/usr/bin/stremio



%files
/opt/*
%ghost /usr/share/applications/smartcode-stremio.desktop
%ghost /usr/bin/stremio
%ghost /usr/local/share/applications/smartcode-stremio.desktop

%post

ln -sf /opt/stremio/smartcode-stremio.desktop /usr/share/applications/smartcode-stremio.desktop
ln -sf /opt/stremio/stremio /usr/bin/stremio

xdg-desktop-menu install --mode system /opt/stremio/smartcode-stremio.desktop

cd /opt/stremio/icons || exit 1
regex="([^_]+)_([0-9]+).png$"
for file in *.png
do
	if [[ $file  =~ $regex ]]
	then
		icon="${BASH_REMATCH[1]##*/}"
		size="${BASH_REMATCH[2]}"
		xdg-icon-resource install --context apps --size "$size" "$file" "$icon"
	fi
done

%changelog
* Fri Jan 28 2022 oran
- 
