#!/bin/sh
# Cyberia
echo "== Cyberia =="
command -v ip >/dev/null 2>&1 || { echo "ERROR: perintah ip tidak ada (jalankan cek-tool.sh)"; exit 1; }
for i in eth0 eth1 eth2; do ip link show $i >/dev/null 2>&1 || { echo "ERROR: $i tidak ada (kabel belum dipasang ke adapter ini)"; exit 1; }; done
# eth0 -> NAT1 (DHCP bila ada client; jika tidak, static 192.168.122.2/24 gateway 192.168.122.1)
ip link set eth0 up
if command -v dhclient >/dev/null 2>&1; then dhclient eth0 2>/dev/null
elif command -v udhcpc >/dev/null 2>&1; then udhcpc -i eth0 -q 2>/dev/null
elif command -v dhcpcd >/dev/null 2>&1; then dhcpcd -4 eth0 2>/dev/null
fi
sleep 2
if ! ip -4 addr show eth0 | grep -q "inet "; then
  echo "INFO: tidak ada DHCP client atau DHCP gagal, pakai alamat static NAT 192.168.122.2/24"
  ip addr add 192.168.122.2/24 dev eth0
fi
ip route | grep -q '^default' || ip route replace default via 192.168.122.1
# eth1 -> A1 (Switch1)
ip addr flush dev eth1 2>/dev/null
ip addr add 192.229.14.1/25 dev eth1
ip link set eth1 up
# eth2 -> A17 (Wired)
ip addr flush dev eth2 2>/dev/null
ip addr add 192.229.16.57/30 dev eth2
ip link set eth2 up
# forwarding dan sysctl pendukung
echo 1 > /proc/sys/net/ipv4/ip_forward 2>/dev/null || sysctl -w net.ipv4.ip_forward=1
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 0 > "$f" 2>/dev/null; done
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do echo 0 > "$f" 2>/dev/null; done
# route
ip route replace 192.229.0.0/19 via 192.229.16.58 || echo "WARN: gagal route 192.229.0.0/19"
# agar semua node bisa menjangkau NAT/internet
if command -v iptables >/dev/null 2>&1; then
  iptables -t nat -C POSTROUTING -o eth0 -s 192.229.0.0/16 -j MASQUERADE 2>/dev/null || iptables -t nat -A POSTROUTING -o eth0 -s 192.229.0.0/16 -j MASQUERADE
else
  echo "WARN: iptables tidak ada, NAT/internet untuk node lain tidak aktif (ping antar-node tetap jalan)"
fi
echo "-- hasil --"
ip -4 addr | grep -E '^[0-9]+:|inet '
ip route
echo "ip_forward = $(cat /proc/sys/net/ipv4/ip_forward)"
ping -c 1 -W 2 192.168.122.1 >/dev/null 2>&1 && echo "OK: NAT 192.168.122.1 terjangkau" || echo "WARN: NAT 192.168.122.1 tidak terjangkau (cek kabel eth0 ke NAT1, atau subnet NAT berbeda)"
