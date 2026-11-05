enable
configure terminal
hostname Cyberia
!
interface FastEthernet0/0
 description Link ke NAT
 ip address 192.168.122.2 255.255.255.0
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch1 (A1 - JJ, MyuMyu)
 ip address 192.229.28.1 255.255.255.128
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Wired (A17)
 ip address 192.229.28.129 255.255.255.252
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 192.229.0.0 255.255.224.0 192.229.28.130
!
ip classless
no ipv6 cef
!
end
write memory
