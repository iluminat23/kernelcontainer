FROM debian:buster-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x; echo "Starting image build for Debian Buster" \
&& apt-get update \
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
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /tmp/* /var/tmp/*

COPY ./build.sh /usr/local/bin/run.sh

CMD /run.sh