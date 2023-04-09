echo "███████╗████████╗ █████╗ ██████╗ ████████╗██╗███╗   ██╗ ██████╗ 
      ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██╔════╝ 
      ███████╗   ██║   ███████║██████╔╝   ██║   ██║██╔██╗ ██║██║  ███╗
      ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██║██║╚██╗██║██║   ██║
      ███████║   ██║   ██║  ██║██║  ██║   ██║   ██║██║ ╚████║╚██████╔╝
      ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝"
apt-get -y -q update && \
apt-get -y -q upgrade && \
apt-get install -y -q software-properties-common && \
add-apt-repository -y -q universe && \
add-apt-repository -y -q multiverse && \
add-apt-repository -y -q restricted && \
apt-get install -y -q python3 python3-pip python3-lxml aria2 \
qbittorrent-nox tzdata p7zip-full p7zip-rar xz-utils curl wget pv jq \
ffmpeg locales neofetch git make g++ gcc automake unzip \
autoconf libtool libsodium-dev libcurl4-openssl-dev libc-ares-dev swig \
libssl-dev libcrypto++-dev zlib1g-dev libsqlite3-dev libfreeimage-dev

echo "██████╗ ██╗   ██╗███╗   ██╗███╗   ██╗██╗███╗   ██╗ ██████╗ 
██╔══██╗██║   ██║████╗  ██║████╗  ██║██║████╗  ██║██╔════╝ 
██████╔╝██║   ██║██╔██╗ ██║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
██╔══██╗██║   ██║██║╚██╗██║██║╚██╗██║██║██║╚██╗██║██║   ██║
██║  ██║╚██████╔╝██║ ╚████║██║ ╚████║██║██║ ╚████║╚██████╔╝
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                                                           "



export MEGA_SDK_VERSION=4.10.0
git clone -q https://github.com/meganz/sdk.git --depth=1 -b v${MEGA_SDK_VERSION} /home/sdk \
&& cd /home/sdk && rm -rf .git \
&& autoupdate -fIv && ./autogen.sh \
&& ./configure --disable-silent-rules --enable-python --with-sodium --disable-examples \
&& make -j$(nproc --all) \
&& cd bindings/python/ && python3 setup.py bdist_wheel \
&& cd dist && ls && pip3 install --no-cache-dir megasdk-*.whl 
echo ""
curl -s https://rclone.org/install.sh | bash
locale-gen en_US.UTF-8 -q
RUN apt-get -y autoremove && apt-get -y autoclean
