#!/bin/bash

nohup /usr/local/bin/net_speeder venet0 "ip" >/dev/null 2>&1 &

/usr/local/caddy/caddy --conf="/usr/local/caddy/Caddyfile"
