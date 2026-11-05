enable
configure terminal
hostname Accela
!
interface FastEthernet0/0
 description Link ke Schumann (A25)
 ip address 192.229.4.10 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch5 (A6 - Omnipresence, Denpa)
 ip address 192.229.0.1 255.255.252.0
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 0.0.0.0 0.0.0.0 192.229.4.9
!
ip classless
no ipv6 cef
!
end
write memory
