#!/bin/sh
# Wired
echo "== Wired =="
command -v ip >/dev/null 2>&1 || { echo "ERROR: perintah ip tidak ada (jalankan cek-tool.sh)"; exit 1; }
for i in eth0 eth1 eth2 eth3; do ip link show $i >/dev/null 2>&1 || { echo "ERROR: $i tidak ada (kabel belum dipasang ke adapter ini)"; exit 1; }; done
# eth0 -> A17 (Cyberia)
ip addr flush dev eth0 2>/dev/null
ip addr add 192.229.16.58/30 dev eth0
ip link set eth0 up
# eth1 -> A16 (Switch2)
ip addr flush dev eth1 2>/dev/null
ip addr add 192.229.16.49/29 dev eth1
ip link set eth1 up
# eth2 -> A18 (Navi)
ip addr flush dev eth2 2>/dev/null
ip addr add 192.229.16.61/30 dev eth2
ip link set eth2 up
# eth3 -> A19 (Tachibana)
ip addr flush dev eth3 2>/dev/null
ip addr add 192.229.16.65/30 dev eth3
ip link set eth3 up
# forwarding dan sysctl pendukung
echo 1 > /proc/sys/net/ipv4/ip_forward 2>/dev/null || sysctl -w net.ipv4.ip_forward=1
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 0 > "$f" 2>/dev/null; done
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do echo 0 > "$f" 2>/dev/null; done
# route
ip route replace 192.229.12.0/23 via 192.229.16.62 || echo "WARN: gagal route 192.229.12.0/23"
ip route replace 192.229.15.64/26 via 192.229.16.62 || echo "WARN: gagal route 192.229.15.64/26"
ip route replace 192.229.10.0/23 via 192.229.16.66 || echo "WARN: gagal route 192.229.10.0/23"
ip route replace 192.229.14.128/25 via 192.229.16.66 || echo "WARN: gagal route 192.229.14.128/25"
ip route replace 192.229.15.128/25 via 192.229.16.66 || echo "WARN: gagal route 192.229.15.128/25"
ip route replace 192.229.16.0/27 via 192.229.16.66 || echo "WARN: gagal route 192.229.16.0/27"
ip route replace 192.229.16.40/29 via 192.229.16.66 || echo "WARN: gagal route 192.229.16.40/29"
ip route replace 192.229.16.64/28 via 192.229.16.66 || echo "WARN: gagal route 192.229.16.64/28"
ip route replace 192.229.16.80/29 via 192.229.16.66 || echo "WARN: gagal route 192.229.16.80/29"
ip route replace 192.229.0.0/22 via 192.229.16.50 || echo "WARN: gagal route 192.229.0.0/22"
ip route replace 192.229.8.0/23 via 192.229.16.51 || echo "WARN: gagal route 192.229.8.0/23"
ip route replace 192.229.15.0/26 via 192.229.16.51 || echo "WARN: gagal route 192.229.15.0/26"
ip route replace 192.229.4.0/22 via 192.229.16.52 || echo "WARN: gagal route 192.229.4.0/22"
ip route replace 192.229.16.32/29 via 192.229.16.52 || echo "WARN: gagal route 192.229.16.32/29"
ip route replace 192.229.16.88/30 via 192.229.16.52 || echo "WARN: gagal route 192.229.16.88/30"
ip route replace default via 192.229.16.57 || echo "WARN: gagal default via 192.229.16.57"
echo "-- hasil --"
ip -4 addr | grep -E '^[0-9]+:|inet '
ip route
echo "ip_forward = $(cat /proc/sys/net/ipv4/ip_forward)"
