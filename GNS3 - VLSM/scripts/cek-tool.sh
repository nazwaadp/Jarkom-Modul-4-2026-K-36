#!/bin/sh
echo "host: $(hostname)"
head -n 2 /etc/os-release 2>/dev/null
for c in ip ping traceroute iptables dhclient udhcpc dhcpcd; do
  if command -v $c >/dev/null 2>&1; then echo "OK      $c"; else echo "MISSING $c"; fi
done
echo "ip_forward = $(cat /proc/sys/net/ipv4/ip_forward 2>/dev/null)"
ip -4 addr 2>/dev/null | grep -E '^[0-9]+:|inet '
