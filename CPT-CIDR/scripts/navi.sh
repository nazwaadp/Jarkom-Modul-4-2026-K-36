enable
configure terminal
hostname Navi
!
interface FastEthernet0/0
 description Link ke Wired (A18)
 ip address 192.229.29.10 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch6 (A7 - Alice, Reika)
 ip address 192.229.24.1 255.255.255.0
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Switch7 (A8 - Taro)
 ip address 192.229.26.1 255.255.255.192
 no shutdown
 exit
!
interface FastEthernet1/1
 description Link ke Switch8 (A9 - Yasuo, Miho, Kuma)
 ip address 192.229.25.1 255.255.255.0
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 0.0.0.0 0.0.0.0 192.229.29.9
!
ip classless
no ipv6 cef
!
end
write memory
