# kernelcontainer

Build the Revolution Pi Kernel in a Docker container.

## Usage

```sh
git clone https://github.com/iluminat23/kernelcontainer.git
cd kernelcontainer
docker-compose run crossbuild
```

This downloads all necessary repositories with their full git history. To
keep the download slim the `build.sh` can be changed before building the
container to include the `--depth 1` flag.

The necessary repositories are the following:

- [linux](https://github.com/RevolutionPi/linux/)
- [piControl](https://github.com/RevolutionPi/piControl)
- [kernelbakery](https://github.com/RevolutionPi/kernelbakery)

These *need* to be in the `kernelcontainer` repository in order to build the
kernel with it.

Building the kernel is supported for both armhf and aarch64. To build for
aarch64, add `ARCH=arm64` to the environment variables that `debian/update.sh`
is called with in `build.sh` and tell `dpkg-buildpackage` to build for the
architecture `arm64`.
