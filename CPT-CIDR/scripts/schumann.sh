enable
configure terminal
hostname Schumann
!
interface FastEthernet0/0
 description Link ke Switch2 (A16)
 ip address 192.229.29.4 255.255.255.248
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Akashic langsung (A5)
 ip address 192.229.4.1 255.255.255.248
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Accela (A25)
 ip address 192.229.4.9 255.255.255.252
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 192.229.4.0 255.255.252.0 192.229.4.10
ip route 0.0.0.0 0.0.0.0 192.229.29.1
!
ip classless
no ipv6 cef
!
end
write memory
