enable
configure terminal
hostname Tachibana
!
interface FastEthernet0/0
 description Link ke Wired (A19)
 ip address 192.229.29.14 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch9 (A10 - Collective, Ghost)
 ip address 192.229.20.1 255.255.254.0
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Deus (A20)
 ip address 192.229.22.1 255.255.255.252
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 192.229.18.0 255.255.255.128 192.229.22.2
ip route 192.229.17.128 255.255.255.128 192.229.22.2
ip route 192.229.16.0 255.255.255.224 192.229.22.2
ip route 192.229.16.128 255.255.255.248 192.229.22.2
ip route 192.229.18.128 255.255.255.252 192.229.22.2
ip route 192.229.16.136 255.255.255.252 192.229.22.2
ip route 192.229.16.96 255.255.255.252 192.229.22.2
ip route 0.0.0.0 0.0.0.0 192.229.29.1
!
ip classless
no ipv6 cef
!
end
write memory
