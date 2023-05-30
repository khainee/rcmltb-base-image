echo -e "\e[1;31mInstalling required package"
apt-get -y update && apt-get -y upgrade
apt-get install -y software-properties-common
add-apt-repository universe
add-apt-repository multiverse
add-apt-repository restricted
apt-get -y update
apt-get install -y python3 python3-pip python3-lxml aria2 \
    tzdata p7zip-full p7zip-rar xz-utils curl wget pv jq \
    ffmpeg locales neofetch git make g++ gcc automake unzip \
    autoconf libtool libsodium-dev libcurl4-openssl-dev libc-ares-dev swig \
    libssl-dev libcrypto++-dev zlib1g-dev libsqlite3-dev libfreeimage-dev
ln -s /usr/bin/aria2c /usr/bin/luffy
echo -e "\e[0m"
echo -e "\e[34;1mInstalling Megasdk and rclone\n\n\n"
export MEGA_SDK_VERSION=4.8.0
git clone https://github.com/meganz/sdk.git --depth=1 -b v$MEGA_SDK_VERSION /home/sdk &&
cd /home/sdk && rm -rf .git &&
autoupdate -fIv && ./autogen.sh &&
./configure --disable-silent-rules --enable-python --with-sodium --disable-examples  &&
make -j$(nproc --all) &&
cd bindings/python/ && python3 setup.py bdist_wheel &&
cd dist && ls && pip3 install --no-cache-dir megasdk-*.whl && cd && rm -rf *
curl  https://rclone.org/install.sh | bash
echo -e "\e[0m"
locale-gen en_US.UTF-8
apt-get -y autoremove && apt-get -y autoclean
pip3 install aiohttp aiofiles aioshutil anytree apscheduler aria2p asyncio bencoding beautifulsoup4 cfscrape dnspython feedparser flask==2.0.3 google-api-python-client google-auth-httplib2 google-auth-oauthlib gunicorn git+https://github.com/zevtyardt/lk21.git httpx lxml motor pillow psutil pybase64 pymongo pyrogram python-dotenv python-magic requests speedtest-cli telegraph tenacity tgCrypto uvloop xattr yt-dlp
