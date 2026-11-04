#!/bin/sh
# Navi
echo "== Navi =="
command -v ip >/dev/null 2>&1 || { echo "ERROR: perintah ip tidak ada (jalankan cek-tool.sh)"; exit 1; }
for i in eth0 eth1 eth2 eth3; do ip link show $i >/dev/null 2>&1 || { echo "ERROR: $i tidak ada (kabel belum dipasang ke adapter ini)"; exit 1; }; done
# eth0 -> A18 (Wired)
ip addr flush dev eth0 2>/dev/null
ip addr add 192.229.16.62/30 dev eth0
ip link set eth0 up
# eth1 -> A7 (Switch6)
ip addr flush dev eth1 2>/dev/null
ip addr add 192.229.12.1/24 dev eth1
ip link set eth1 up
# eth2 -> A8 (Switch7)
ip addr flush dev eth2 2>/dev/null
ip addr add 192.229.15.65/26 dev eth2
ip link set eth2 up
# eth3 -> A9 (Switch8)
ip addr flush dev eth3 2>/dev/null
ip addr add 192.229.13.1/24 dev eth3
ip link set eth3 up
# forwarding dan sysctl pendukung
echo 1 > /proc/sys/net/ipv4/ip_forward 2>/dev/null || sysctl -w net.ipv4.ip_forward=1
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 0 > "$f" 2>/dev/null; done
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do echo 0 > "$f" 2>/dev/null; done
# route
ip route replace default via 192.229.16.61 || echo "WARN: gagal default via 192.229.16.61"
echo "-- hasil --"
ip -4 addr | grep -E '^[0-9]+:|inet '
ip route
echo "ip_forward = $(cat /proc/sys/net/ipv4/ip_forward)"
