#!/bin/sh
echo "----------------------------------------------------"
echo "             LOG PENGUJIAN JARINGAN                 "
echo "----------------------------------------------------"
echo "Host Penguji : $(hostname)"
echo "Waktu Uji    : $(date)"
echo "----------------------------------------------------"

PASS=0
FAIL=0

test_target() {
  NAME="$1"
  IP="$2"
  DESC="$3"

  printf "%-12s (%-15s) - %-32s : " "$NAME" "$IP" "$DESC"
  if ping -c 1 "$IP" >/dev/null 2>&1; then
    echo "SUCCESS"
    PASS=$((PASS + 1))
  else
    echo "FAILED"
    FAIL=$((FAIL + 1))
  fi
}

test_target "Masayuki" "192.229.8.2" "Jalur Switch2 (rp_filter check)"
test_target "Mika" "192.229.15.195" "Rantai Hop Terpanjang (9 Hops)"
test_target "NAT1" "192.168.122.1" "NAT Masquerade Check"
test_target "Alice" "192.229.12.2" "Cross-Branch Memutar (Accela-Navi)"
test_target "Lin" "192.229.0.3" "Same Subnet Switch3"
test_target "MyuMyu" "192.229.14.3" "Same Subnet Switch1"
test_target "Akashic" "192.229.16.34" "Psyche to Schumann Router"
test_target "Juri" "192.229.15.2" "Copland Direct Interface"
test_target "Denpa" "192.229.4.3" "Switch5 Local Access"
test_target "Reika" "192.229.12.3" "Switch6 Local Access"
test_target "Taro" "192.229.15.66" "Navi Internal Routing"
test_target "Yasuo" "192.229.13.2" "Switch8 Local Access"
test_target "Collective" "192.229.10.2" "Switch9 Local Access"
test_target "Lilith" "192.229.14.130" "Switch10 Local Access"
test_target "Chisa" "192.229.15.130" "Switch11 Local Access"
test_target "Eiri" "192.229.16.42" "Knights Direct Host"

echo "----------------------------------------------------"
echo " Ringkasan: SUCCESS = $PASS | FAILED = $FAIL"
echo "----------------------------------------------------"
