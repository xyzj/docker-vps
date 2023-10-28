#!/bin/sh

wget https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat -O /tmp/geoip.dat && mv /tmp/geoip.dat /opt/bin/

wget https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat -O /tmp/geosite.dat && mv /tmp/geosite.dat /opt/bin/

wget https://github.com/v2fly/geoip/releases/latest/download/geoip-only-cn-private.dat -O /tmp/geoip-only-cn-private.dat && mv /tmp/geoip-only-cn-private.dat /opt/bin

sleep 1

es restart v2ray
