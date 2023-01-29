FROM alpine:3.16
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apk update
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing --update
RUN apk add alpine-sdk git libtool autoconf automake linux-headers musl-dev m4 \
    build-base perl ca-certificates python3 py3-pip aria2 qbittorrent-nox p7zip \
    tzdata xz curl pv jq unzip tar wget ffmpeg \
    zlib-dev zlib-static curl-dev curl-static openssl-dev openssl-libs-static freeimage freeimage-dev unzip tar xz wget \
    c-ares-dev c-ares-static sqlite-dev sqlite-static  libsodium-dev libsodium-static \
RUN wget https://github.com/tonmoyislam250/megasdk-latest/releases/download/v1/crypto++static.zip \
    && unzip crypto++static.zip && cd crypto++static && apk add --allow-untrusted *
RUN type ffmpeg && type aria2c && type qbittorrent-nox
