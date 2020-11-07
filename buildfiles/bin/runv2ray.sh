#!/bin/bash

start-stop-daemon --stop -p /run/v2.pid

# service privoxy restart

# start-stop-daemon --start --name trojanc --background --exec /root/bin/trojan -- -c /root/bin/trojan.client
start-stop-daemon --start -m -p /run/v2.pid --background --exec /root/bin/v2ray -- -config=/root/bin/v2client.json

# /bin/bash
