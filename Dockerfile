FROM alpine:3.16
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apk update
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing --update
RUN apk add alpine-sdk git libtool autoconf automake linux-headers musl-dev m4 \
    build-base perl ca-certificates python3 py3-pip aria2 qbittorrent-nox
