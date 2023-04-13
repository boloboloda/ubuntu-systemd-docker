# Ubuntu Systemd Docker

This is a Dockerfile for building an Ubuntu image with systemd and some common packages installed.

## How to use

To use this image, you can pull it from Docker Hub:
```bash
docker pull <username>/ubuntu-systemd-docker
```

Alternatively, you can build it locally by cloning this repository and running the following command:
```arduino
docker build -t <image-name> .
```

To run a container based on this image, use the following command:
```arduino
docker run -ti --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:rw <image-name>
```

## Packages installed

* curl
* git
* nano
* nginx
* openssh-server
* openssl
* python3
* python3-pip
* sudo
* vim
* wget
* gnupg
* openssh-client
* systemd

## Note

This image is based on Ubuntu and uses systemd as the init system. It is intended for use cases where systemd is required, such as running systemd-based applications or services. However, please note that running systemd in a container may not be suitable for all use cases and may require some additional configuration.
