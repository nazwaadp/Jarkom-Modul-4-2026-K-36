enable
configure terminal
hostname Phantoma
!
interface FastEthernet0/0
 description Link ke Knights (A23)
 ip address 192.229.16.138 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch12 (A14 - Semi)
 ip address 192.229.16.65 255.255.255.224
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Shibuya (A24)
 ip address 192.229.16.97 255.255.255.252
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 192.229.16.192 255.255.255.128 192.229.16.98
ip route 0.0.0.0 0.0.0.0 192.229.16.137
!
ip classless
no ipv6 cef
!
end
write memory
