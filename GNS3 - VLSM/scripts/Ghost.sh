#!/bin/sh
# Ghost
echo "== Ghost =="
command -v ip >/dev/null 2>&1 || { echo "ERROR: perintah ip tidak ada"; exit 1; }
ip link show eth0 >/dev/null 2>&1 || { echo "ERROR: eth0 tidak ada (kabel belum dipasang ke node ini)"; exit 1; }
ip addr flush dev eth0 2>/dev/null
ip addr add 192.229.10.3/23 dev eth0
ip link set eth0 up
ip route replace default via 192.229.10.1 || echo "WARN: gagal default route"
echo "-- hasil --"
ip -4 addr | grep -E 'inet '
ip route
ping -c 1 -W 1 192.229.10.1 >/dev/null 2>&1 && echo "OK: gateway 192.229.10.1 terjangkau" || echo "WARN: gateway 192.229.10.1 belum terjangkau (cek router dan kabel)"
