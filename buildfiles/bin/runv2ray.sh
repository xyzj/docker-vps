#!/bin/bash

pkill -f trojan

service privoxy restart

# start-stop-daemon --start --name trojanc --background --exec /root/bin/trojan -- -c /root/bin/trojan.client
start-stop-daemon --start --name v2rayc --background --exec /root/bin/v2ray -- -config=/root/bin/v2ray.client

# /bin/bash
