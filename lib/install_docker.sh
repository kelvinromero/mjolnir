#!/bin/bash

echo "Removing old docker"
sudo dnf remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine

echo "Setting up repo"
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo5

echo "Installing docker"
sudo dnf install docker-ce docker-ce-cli containerd.io

echo "Backward compatibility for Cgroups."
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"

echo "Starting docker"
sudo systemctl start docker
