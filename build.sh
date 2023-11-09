#!/bin/bash
set -e

export LC_ALL=C.UTF-8
export DEBIAN_FRONTEND=noninteractive

cd /data
ls -l .
if [ ! -d linux ]; then
    git clone https://github.com/RevolutionPi/linux
fi
if [ ! -d piControl ]; then
    git clone https://github.com/RevolutionPi/piControl
fi
if [ ! -d kernelbakery ]; then
    git clone https://github.com/RevolutionPi/kernelbakery
fi

cd kernelbakery
LINUXDIR=$PWD/../linux PIKERNELMODDIR=$PWD/../piControl debian/update.sh
dpkg-buildpackage -a armhf -b -us -uc
