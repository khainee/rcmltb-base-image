echo "START"
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
echo "Running"
git clone https://github.com/meganz/sdk.git --depth=1 -b v$MEGA_SDK_VERSION /home/sdk \
&& cd /home/sdk && rm -rf .git \
&& autoupdate -fIv && ./autogen.sh \
&& ./configure --disable-silent-rules --enable-python --with-sodium --disable-examples \
&& make -j$(nproc --all) \
&& cd bindings/python/ && python3 setup.py bdist_wheel \
&& cd dist && ls && pip3 install --no-cache-dir megasdk-*.whl 
