FROM --platform=linux/amd64 ubuntu:latest

# Set the environment variable to avoid debconf warning
ENV DEBIAN_FRONTEND=noninteractive

# Update the package index and install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    nano \
    nginx \
    openssh-server \
    openssl \
    python3 \
    python3-pip \
    sudo \
    vim \
    wget \
    gnupg

# Install SCP
RUN apt-get install -y openssh-client

# Install systemd
RUN apt-get install -y systemd && \
    rm -rf /var/cache/apt/* && \
    mkdir -p /run/systemd && \
    echo "export TZ='Asia/Shanghai'" >> /etc/profile

# Set the environment variable to enable systemd
ENV container docker

# Enable systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) && \
     rm -f /lib/systemd/system/multi-user.target.wants/* && \
     rm -f /etc/systemd/system/*.wants/* && \
     rm -f /lib/systemd/system/local-fs.target.wants/* && \
     rm -f /lib/systemd/system/sockets.target.wants/*udev* && \
     rm -f /lib/systemd/system/sockets.target.wants/*initctl* && \
     rm -f /lib/systemd/system/basic.target.wants/* && \
     rm -f /lib/systemd/system/anaconda.target.wants/*

# VOLUME [ "/sys/fs/cgroup" ]

# Set the default user to root
USER root

# Set the working directory to the root user's home directory
WORKDIR /root

# Start systemd on boot
CMD ["/sbin/init"]
