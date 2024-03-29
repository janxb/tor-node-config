#!/bin/bash
set -eu

if [ ! -d "/usr/local/sbin" ]; then
 git clone https://github.com/janxb/serverutils /usr/local/sbin
fi

echo "deb https://deb.torproject.org/torproject.org bionic main" >/etc/apt/sources.list.d/tor.list

apt-key-download https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89

apt update

apt purge lxd* lxc*

apt install iftop iotop python3-distutils tor deb.torproject.org-keyring tor-geoipdb nyx
