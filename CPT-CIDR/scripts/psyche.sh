enable
configure terminal
hostname Psyche
!
interface FastEthernet0/0
 description Link ke Switch2 (A16)
 ip address 192.229.29.2 255.255.255.248
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch3 (A2 - Karl, Lin)
 ip address 192.229.8.1 255.255.252.0
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
