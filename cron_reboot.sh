#!/bin/bash
set -eu

DIR=/root/tor-node-config

git -C $DIR pull -q

$DIR/generate_tor_config.sh
