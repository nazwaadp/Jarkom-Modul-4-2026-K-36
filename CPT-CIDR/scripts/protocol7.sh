enable
configure terminal
hostname Protocol7
!
interface FastEthernet0/0
 description Link ke Deus (A21)
 ip address 192.229.18.130 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch11 (A12 - Chisa, Hodgeson)
 ip address 192.229.17.1 255.255.255.192
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Knights (A22)
 ip address 192.229.17.65 255.255.255.252
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 192.229.16.192 255.255.255.128 192.229.17.66
ip route 192.229.16.0 255.255.255.224 192.229.17.66
ip route 192.229.16.128 255.255.255.248 192.229.17.66
ip route 192.229.16.136 255.255.255.252 192.229.17.66
ip route 192.229.16.96 255.255.255.252 192.229.17.66
ip route 0.0.0.0 0.0.0.0 192.229.18.129
!
ip classless
no ipv6 cef
!
end
write memory
