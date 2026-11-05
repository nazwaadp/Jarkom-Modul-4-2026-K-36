enable
configure terminal
hostname Deus
!
interface FastEthernet0/0
 description Link ke Tachibana (A20)
 ip address 192.229.22.2 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch10 (A11 - Lilith, Specter)
 ip address 192.229.18.1 255.255.255.128
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Protocol7 (A21)
 ip address 192.229.18.129 255.255.255.252
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 192.229.17.128 255.255.255.128 192.229.18.130
ip route 192.229.16.0 255.255.255.224 192.229.18.130
ip route 192.229.16.128 255.255.255.248 192.229.18.130
ip route 192.229.17.64 255.255.255.252 192.229.18.130
ip route 192.229.16.136 255.255.255.252 192.229.18.130
ip route 192.229.16.96 255.255.255.252 192.229.18.130
ip route 0.0.0.0 0.0.0.0 192.229.16.69
!
ip classless
no ipv6 cef
!
end
write memory
