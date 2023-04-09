apt-get -y update && \
apt-get -y upgrade && \
apt-get install -y software-properties-common && \
add-apt-repository universe && \
add-apt-repository multiverse && \
add-apt-repository restricted && \
apt-get install -y python3 python3-pip python3-lxml aria2 \
qbittorrent-nox tzdata p7zip-full p7zip-rar xz-utils curl wget pv jq \
ffmpeg locales neofetch git make g++ gcc automake unzip \
autoconf libtool libsodium-dev libcurl4-openssl-dev libc-ares-dev swig \
libssl-dev libcrypto++-dev zlib1g-dev libsqlite3-dev libfreeimage-dev
