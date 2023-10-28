#!/bin/bash

start-stop-daemon -p /tmp/caddy.pid --stop
start-stop-daemon -p /tmp/v2ray.pid --stop

sleep 1

start-stop-daemon -m -p /tmp/v2ray.pid -d /opt/bin --start --background --exec /opt/bin/v2ray -- run -c /opt/bin/v2server.json
#start-stop-daemon -m -p /tmp/vpstools.pid --start --background --exec /opt/bin/vpstools -- -http=2052

sleep 1

start-stop-daemon --start --background -m -p /tmp/caddy.pid -d /opt/bin --exec /opt/bin/caddy_linux_amd64_custom -- run --config /opt/bin/Caddyfile

#rc-service nginx restart
