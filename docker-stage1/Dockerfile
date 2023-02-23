FROM debian:bullseye

RUN apt-get update --fix-missing && apt-get -y upgrade

ADD scripts /scripts

RUN /scripts/pre-build.sh

RUN apt-get install -y apt-utils
RUN apt-get -y --no-install-recommends install git debhelper python python3 pkg-config ninja-build python-jinja2 ca-certificates gsettings-desktop-schemas-dev wget flex yasm xvfb wdiff gperf bison valgrind xz-utils x11-apps xfonts-base libglew-dev libgl1-mesa-dev libglu1-mesa-dev libegl1-mesa-dev libgles2-mesa-dev mesa-common-dev libxt-dev libre2-dev libgbm-dev libpng-dev libxss-dev libelf-dev libvpx-dev libpci-dev libcap-dev libdrm-dev libicu-dev libffi-dev libkrb5-dev libexif-dev libflac-dev libudev-dev libopus-dev libwebp-dev libxtst-dev libjpeg-dev libxml2-dev libgtk-3-dev libxslt1-dev liblcms2-dev libpulse-dev libpam0g-dev libsnappy-dev libavutil-dev libavcodec-dev libavformat-dev libglib2.0-dev libasound2-dev libjsoncpp-dev libspeechd-dev libminizip-dev libhunspell-dev libusb-1.0-0-dev libopenjp2-7-dev libmodpbase64-dev libnss3-dev libnspr4-dev libcups2-dev libevent-dev libjs-jquery libjs-jquery-flot libgcrypt20-dev libva-dev fonts-ipafont-gothic fonts-ipafont-mincho uuid-dev xcb-proto python3-xcbgen python-setuptools libx11-xcb-dev libxcb-dri3-dev libxshmfence-dev imagemagick desktop-file-utils binutils libcurl4-openssl-dev lsb-release wget software-properties-common gnupg2

WORKDIR /root

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN add-apt-repository "deb http://apt.llvm.org/bullseye llvm-toolchain-bullseye main"
RUN apt-get update

RUN apt-get install -y libllvm-16-ocaml-dev libllvm16 llvm-16 llvm-16-dev llvm-16-doc llvm-16-examples llvm-16-runtime clang-16 clang-tools-16 clang-16-doc libclang-common-16-dev libclang-16-dev libclang1-16 clang-format-16 clangd-16 libfuzzer-16-dev lldb-16 lld-16 libc++-16-dev libc++abi-16-dev libomp-16-dev libunwind-16-dev

RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-16 800
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-16 800
RUN update-alternatives --install /usr/bin/llvm-ar llvm-ar /usr/bin/llvm-ar-16 800
RUN update-alternatives --install /usr/bin/llvm-nm llvm-nm /usr/bin/llvm-nm-16 800

RUN apt-get install -y fuse libfuse2

RUN wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN add-apt-repository "deb https://deb.nodesource.com/node_14.x bullseye main"
RUN apt-get update

RUN apt-get install -y nodejs node-typescript uglifyjs.terser

RUN mkdir /repo
WORKDIR /repo
