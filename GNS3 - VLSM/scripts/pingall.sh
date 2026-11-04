#!/bin/sh
# /root/pingall.sh
command -v ping >/dev/null 2>&1 || { echo 'ERROR: ping tidak ada'; exit 1; }
ok=0; fail=0
for p in \
  JJ=192.229.14.2 MyuMyu=192.229.14.3 Karl=192.229.0.2 Lin=192.229.0.3 \
  Juri=192.229.15.2 Masayuki=192.229.8.2 Akashic=192.229.16.34 Denpa=192.229.4.3 \
  Omnipresence=192.229.4.2 Alice=192.229.12.2 Reika=192.229.12.3 Taro=192.229.15.66 \
  Kuma=192.229.13.4 Miho=192.229.13.3 Yasuo=192.229.13.2 Collective=192.229.10.2 \
  Ghost=192.229.10.3 Lilith=192.229.14.130 Specter=192.229.14.131 Chisa=192.229.15.130 \
  Hodgeson=192.229.15.131 Eiri=192.229.16.42 Semi=192.229.16.2 Lain=192.229.15.194 \
  Mika=192.229.15.195 Cyberia_A1=192.229.14.1 Cyberia_A17=192.229.16.57 Wired_A17=192.229.16.58 \
  Wired_A16=192.229.16.49 Wired_A18=192.229.16.61 Wired_A19=192.229.16.65 Navi_A18=192.229.16.62 \
  Navi_A7=192.229.12.1 Navi_A8=192.229.15.65 Navi_A9=192.229.13.1 Tachibana_A19=192.229.16.66 \
  Tachibana_A10=192.229.10.1 Tachibana_A20=192.229.16.69 Deus_A20=192.229.16.70 Deus_A11=192.229.14.129 \
  Deus_A21=192.229.16.73 Protocol7_A21=192.229.16.74 Protocol7_A12=192.229.15.129 Protocol7_A22=192.229.16.77 \
  Knights_A22=192.229.16.78 Knights_A13=192.229.16.41 Knights_A23=192.229.16.81 Phantoma_A23=192.229.16.82 \
  Phantoma_A14=192.229.16.1 Phantoma_A24=192.229.16.85 Shibuya_A24=192.229.16.86 Shibuya_A15=192.229.15.193 \
  Psyche_A16=192.229.16.50 Psyche_A2=192.229.0.1 Copland_A16=192.229.16.51 Copland_A3=192.229.15.1 \
  Copland_A4=192.229.8.1 Schumann_A16=192.229.16.52 Schumann_A5=192.229.16.33 Schumann_A25=192.229.16.89 \
  Accela_A25=192.229.16.90 Accela_A6=192.229.4.1 \
  ; do
  n=${p%%=*}; ip=${p##*=}
  if ping -c 1 -W 1 "$ip" >/dev/null 2>&1; then ok=$((ok+1)); else echo "FAIL $n $ip"; fail=$((fail+1)); fi
done
echo "Selesai: $ok OK, $fail FAIL dari $((ok+fail))"
