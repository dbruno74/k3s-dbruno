#!/bin/bash

sudo mkdir -p /run/user/0/snap.k3s
sudo chmod 700 /run/user/0
sudo wget https://raw.githubusercontent.com/dbruno74/k3s-dbruno/main/cri-containerd.apparmor.d -O /var/lib/snapd/apparmor/profiles/cri-containerd.apparmor.d
sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/cri-containerd.apparmor.d
sudo snap install k3s-dbruno --edge --devmode

