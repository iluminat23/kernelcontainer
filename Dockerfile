FROM debian:bullseye-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x; \
apt-get update \
&& apt-get install -y eatmydata \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /tmp/* /var/tmp/*

ENV LD_PRELOAD=libeatmydata.so
ENV LD_LIBRARY_PATH=/usr/lib/libeatmydata

RUN set -x; \
apt-get update \
&& apt-get -y -q install --no-install-recommends --yes \
    build-essential \
    libssl-dev \
    devscripts \
    gcc-arm-linux-gnueabihf \
    libc6-dev-armhf-cross \
    git \
    bison \
    flex \
    bc \
    rsync \
    debhelper \
    kmod \
    eatmydata\
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /tmp/* /var/tmp/*

COPY ./build.sh /run.sh

CMD /run.sh
