#!/bin/bash
set -eu

DIR=/root/tor-node-config

do-package-upgrades -y &>> /var/log/tor/package-upgrades.log

git -C $DIR pull &>> /var/log/tor/git-pull.log

$DIR/generate_tor_config.sh

service tor reload
