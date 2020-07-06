#!/bin/bash
cd /data
set -e
if [ ! -d linux ]; then
    git clone -b revpi-4.19 https://github.com/RevolutionPi/linux
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