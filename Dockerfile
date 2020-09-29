FROM debian:buster-slim

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
&& rm -rf /tmp/* /var/tmp/*

COPY ./build.sh /usr/local/bin/

CMD /usr/local/bin/build.sh