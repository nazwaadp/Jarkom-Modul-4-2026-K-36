enable
configure terminal
hostname Shibuya
!
interface FastEthernet0/0
 description Link ke Phantoma (A24)
 ip address 192.229.16.98 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch13 (A15 - Lain, Mika)
 ip address 192.229.16.1 255.255.255.192
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 0.0.0.0 0.0.0.0 192.229.16.97
!
ip classless
no ipv6 cef
!
end
write memory
