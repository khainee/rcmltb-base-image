print 'Running apt update'
apt-get -y update >/dev/null && \
apt-get -y upgrade >/dev/null && \
apt-get -y install apt-utils >/dev/null && \
print 'Installing package'
apt-get install -y software-properties-common >/dev/null && \
add-apt-repository -y universe && \
add-apt-repository -y multiverse && \
add-apt-repository -y restricted && \
apt-get install -y --no-install-recommends python3 python3-lxml aria2 tzdata p7zip-full p7zip-rar xz-utils curl wget pv jq ffmpeg locales neofetch git make g++ gcc automake unzip autoconf >/dev/null
apt-get install -y python3-pip >/dev/null
print 'install mega sdk'
export MEGA_SDK_VERSION=4.8.0
git clone https://github.com/meganz/sdk.git --depth=1 -b v${MEGA_SDK_VERSION} /home/sdk \
&& cd /home/sdk && rm -rf .git \
&& autoupdate -fIv && ./autogen.sh \
&& ./configure --disable-silent-rules --enable-python --with-sodium --disable-examples \
&& make -j$(nproc --all) \
&& cd bindings/python/ && python3 setup.py bdist_wheel \
&& cd dist && ls && pip3 install --no-cache-dir megasdk-*.whl 
curl  https://rclone.org/install.sh | bash >/dev/null
locale-gen en_US.UTF-8
apt-get -y autoremove && apt-get -y autoclean >/dev/null
#pip3 install aiohttp aiofiles aioshutil anytree apscheduler aria2p asyncio bencoding beautifulsoup4 cfscrape dnspython feedparser flask==2.0.3 google-api-python-client google-auth-httplib2 google-auth-oauthlib gunicorn git+https://github.com/zevtyardt/lk21.git httpx lxml motor pillow psutil pybase64 pymongo pyrogram python-dotenv python-magic requests speedtest-cli telegraph tenacity tgCrypto uvloop xattr yt-dlp
