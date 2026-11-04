#!/bin/sh
# Copland
echo "== Copland =="
command -v ip >/dev/null 2>&1 || { echo "ERROR: perintah ip tidak ada (jalankan cek-tool.sh)"; exit 1; }
for i in eth0 eth1 eth2; do ip link show $i >/dev/null 2>&1 || { echo "ERROR: $i tidak ada (kabel belum dipasang ke adapter ini)"; exit 1; }; done
# eth0 -> A16 (Switch2)
ip addr flush dev eth0 2>/dev/null
ip addr add 192.229.16.51/29 dev eth0
ip link set eth0 up
# eth1 -> A3 (Juri)
ip addr flush dev eth1 2>/dev/null
ip addr add 192.229.15.1/26 dev eth1
ip link set eth1 up
# eth2 -> A4 (Switch4)
ip addr flush dev eth2 2>/dev/null
ip addr add 192.229.8.1/23 dev eth2
ip link set eth2 up
# forwarding dan sysctl pendukung
echo 1 > /proc/sys/net/ipv4/ip_forward 2>/dev/null || sysctl -w net.ipv4.ip_forward=1
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 0 > "$f" 2>/dev/null; done
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do echo 0 > "$f" 2>/dev/null; done
# route
ip route replace default via 192.229.16.49 || echo "WARN: gagal default via 192.229.16.49"
echo "-- hasil --"
ip -4 addr | grep -E '^[0-9]+:|inet '
ip route
echo "ip_forward = $(cat /proc/sys/net/ipv4/ip_forward)"
