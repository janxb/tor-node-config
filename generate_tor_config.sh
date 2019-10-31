#!/bin/bash
set -eu

IPV4ADDR=$(/sbin/ip -4 addr | grep inet | awk -F '[ \t]+|/' '{print $3}' | grep -v ^127)
IPV6ADDR=$(/sbin/ip -6 addr | grep inet6 | awk -F '[ \t]+|/' '{print $3}' | grep -v ^::1 | grep -v ^fe80)
HOSTNAME=$(hostname)

cat <<EOT > /etc/tor/torrc
SocksPort 0
RunAsDaemon 1
ORPort $IPV4ADDR:443
ORPort [$IPV6ADDR]:443
Nickname ${HOSTNAME}janxbde
ContactInfo tor-janbrodda-de
Log notice file /var/log/tor/notices.log
DirPort 80
IPv6Exit 1
RelayBandwidthRate 125 MBits
RelayBandwidthBurst 200 MBits
DisableDebuggerAttachment 0
ControlPort 9051
CookieAuthentication 1
ExitPolicy accept *:53        # DNS
ExitPolicy accept *:80        # HTTP
ExitPolicy accept *:443       # HTTPS
ExitPolicy reject *:*
EOT
