#!/bin/bash

start-stop-daemon --start --name hcloud --background --exec /root/bin/hcloud -- -debug -conf=/root/bin/hcloud.conf -http=80
start-stop-daemon --start --name trojan --background --exec /root/bin/trojan -- -c /root/bin/trojan.server
start-stop-daemon --start --name v2ray --background --exec /root/bin/v2ray -- -config=/root/bin/v2ray.server

# /bin/bash
