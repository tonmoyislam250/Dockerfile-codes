FROM alpine:latest
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN cat /etc/os-release
RUN apk update
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing --update
RUN apk add alpine-sdk git libtool autoconf automake linux-headers musl-dev m4 \
    build-base perl ca-certificates python3 python3-dev py3-pip py3-wheel aria2 qbittorrent-nox p7zip \
    tzdata xz curl pv jq unzip tar wget ffmpeg libpq-dev libffi-dev \
    zlib-dev zlib-static curl-dev curl-static openssl-dev openssl-libs-static freeimage freeimage-dev unzip tar xz wget \
    sqlite-dev sqlite-static  libsodium-dev libsodium-static
RUN curl -L https://github.com/tonmoyislam250/megasdkrest/releases/download/v4.19.0/megasdkrest-amd64 \
    -o /usr/local/bin/megasdkrest && chmod +x /usr/local/bin/megasdkrest
RUN wget https://github.com/tonmoyislam250/fluffy-guide/releases/download/v1.0.7/packages.tar.gz \
    && tar -xzf packages.tar.gz && \
    cd packages/crypto/x86_64/ && apk add --allow-untrusted *.apk && \
    cd ../../cares/x86_64/ && apk add --allow-untrusted *.apk

RUN type ffmpeg && type aria2c && type qbittorrent-nox
RUN mv /usr/bin/aria2c /usr/bin/mrbeast && mkdir -pv /usr/src/test && mkdir -pv /usr/src/binary && \
    mv /usr/bin/qbittorrent-nox /usr/bin/pewdiepie && \
    mv /usr/bin/ffmpeg /usr/bin/mutahar
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY pewdiepie.pyx setup.py /usr/src/test/
RUN cd /usr/src/test/ && python3 setup.py build_ext --inplace && cp pewdiepie.cpython-310-x86_64-linux-gnu.so /usr/src/binary/pewdiepie.so
COPY start.sh race.py .
RUN ls -la /usr/src/binary/ && ls -la
