enable
configure terminal
hostname Copland
!
interface FastEthernet0/0
 description Link ke Switch2 (A16)
 ip address 192.229.29.3 255.255.255.248
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Juri langsung (A3)
 ip address 192.229.14.1 255.255.255.192
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Switch4 (A4 - Masayuki)
 ip address 192.229.12.1 255.255.254.0
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 0.0.0.0 0.0.0.0 192.229.29.1
!
ip classless
no ipv6 cef
!
end
write memory
