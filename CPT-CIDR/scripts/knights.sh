enable
configure terminal
hostname Knights
!
interface FastEthernet0/0
 description Link ke Protocol7 (A22)
 ip address 192.229.17.66 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Eiri langsung (A13)
 ip address 192.229.16.129 255.255.255.248
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Phantoma (A23)
 ip address 192.229.16.137 255.255.255.252
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 192.229.16.192 255.255.255.128 192.229.16.138
ip route 192.229.16.0 255.255.255.224 192.229.16.138
ip route 192.229.16.96 255.255.255.252 192.229.16.138
ip route 0.0.0.0 0.0.0.0 192.229.17.65
!
ip classless
no ipv6 cef
!
end
write memory
