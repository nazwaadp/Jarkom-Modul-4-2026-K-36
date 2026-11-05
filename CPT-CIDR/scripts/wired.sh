enable
configure terminal
hostname Wired
!
interface FastEthernet0/0
 description Link ke Cyberia (A17)
 ip address 192.229.28.130 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet0/1
 description Link ke Switch2 (A16)
 ip address 192.229.29.1 255.255.255.248
 no shutdown
 exit
!
interface FastEthernet1/0
 description Link ke Navi (A18)
 ip address 192.229.29.9 255.255.255.252
 no shutdown
 exit
!
interface FastEthernet1/1
 description Link ke Tachibana (A19)
 ip address 192.229.29.13 255.255.255.252
 no shutdown
 exit
!
interface Vlan1
 no ip address
 shutdown
 exit
!
ip route 192.229.24.0 255.255.254.0 192.229.29.10
ip route 192.229.26.0 255.255.255.192 192.229.29.10
ip route 192.229.20.0 255.255.254.0 192.229.29.14
ip route 192.229.18.128 255.255.255.128 192.229.29.14
ip route 192.229.17.128 255.255.255.128 192.229.29.14
ip route 192.229.16.0 255.255.255.224 192.229.29.14
ip route 192.229.16.128 255.255.255.248 192.229.29.14
ip route 192.229.22.0 255.255.255.252 192.229.29.14
ip route 192.229.18.128 255.255.255.252 192.229.29.14
ip route 192.229.17.64 255.255.255.252 192.229.29.14
ip route 192.229.16.136 255.255.255.252 192.229.29.14
ip route 192.229.16.96 255.255.255.252 192.229.29.14
ip route 192.229.0.0 255.255.252.0 192.229.29.2
ip route 192.229.12.0 255.255.254.0 192.229.29.3
ip route 192.229.14.0 255.255.255.192 192.229.29.3
ip route 192.229.4.0 255.255.252.0 192.229.29.4
ip route 192.229.4.0 255.255.255.248 192.229.29.4
ip route 192.229.4.8 255.255.255.252 192.229.29.4
ip route 0.0.0.0 0.0.0.0 192.229.28.129
!
ip classless
no ipv6 cef
!
end
write memory
