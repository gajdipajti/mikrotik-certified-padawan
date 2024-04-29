# 1970-01-02 02:34:17 by RouterOS 7.13.3
# software id = BRCV-4GVR
#
# model = RB952Ui-5ac2nD
# serial number = 6B33069AB3CA
/interface bridge add name=bridge1
/interface wireless set [ find default-name=wlan1 ] country=hungary disabled=no mode=ap-bridge ssid=M-2g
/interface wireless set [ find default-name=wlan2 ] country=hungary disabled=no mode=ap-bridge ssid=M-5g
/interface wireless security-profiles set [ find default=yes ] authentication-types=wpa2-psk mode=dynamic-keys supplicant-identity=MikroTik
/ip hotspot profile set [ find default=yes ] html-directory=hotspot
/ip pool add name=dhcp_pool0 ranges=10.20.0.100-10.20.0.150
/ip dhcp-server add address-pool=dhcp_pool0 interface=bridge1 name=dhcp1
/routing table add disabled=no fib name=ny1
/routing table add disabled=no fib name=ny2
/interface bridge port add bridge=bridge1 interface=wlan1
/interface bridge port add bridge=bridge1 interface=wlan2
/interface bridge port add bridge=bridge1 interface=ether2
/ip address add address=192.168.1.254/24 interface=ether5 network=192.168.1.0
/ip address add address=192.168.1.253/24 interface=ether4 network=192.168.1.0
/ip address add address=10.20.0.1/24 interface=bridge1 network=10.20.0.0
/ip address add address=10.20.0.2/24 interface=bridge1 network=10.20.0.0
/ip dhcp-server network add address=10.20.0.0/24 gateway=10.20.0.1
/ip firewall mangle add action=mark-connection chain=prerouting dst-address=10.20.0.1 new-connection-mark=ny1 passthrough=yes
/ip firewall mangle add action=mark-connection chain=prerouting dst-address=10.20.0.2 new-connection-mark=ny2 passthrough=yes
/ip firewall mangle add action=mark-routing chain=prerouting connection-mark=ny1 new-routing-mark=ny1 passthrough=yes
/ip firewall mangle add action=mark-routing chain=prerouting connection-mark=ny2 new-routing-mark=ny2 passthrough=yes
/ip firewall nat add action=dst-nat chain=dstnat dst-address=10.20.0.1 to-addresses=192.168.1.1
/ip firewall nat add action=dst-nat chain=dstnat dst-address=10.20.0.2 to-addresses=192.168.1.1
/ip firewall nat add action=masquerade chain=srcnat dst-address=192.168.1.1
/ip route add disabled=no distance=1 dst-address=192.168.1.1/32 gateway=ether5 pref-src="" routing-table=ny1 scope=30 suppress-hw-offload=no target-scope=10
/ip route add disabled=no distance=1 dst-address=192.168.1.1/32 gateway=ether4 pref-src="" routing-table=ny2 scope=30 suppress-hw-offload=no target-scope=10
/ip route add blackhole disabled=no distance=1 dst-address=192.168.1.1/32 gateway=ether5 pref-src="" routing-table=ny2 scope=30 suppress-hw-offload=no target-scope=10
/ip route add blackhole disabled=no distance=1 dst-address=192.168.1.1/32 gateway=ether4 pref-src="" routing-table=ny1 scope=30 suppress-hw-offload=no target-scope=10
#error exporting "/ip/ssh" (timeout)
/routing rule add action=lookup disabled=no interface=ether5 routing-mark=ny1 table=main
/routing rule add action=lookup disabled=no interface=ether4 routing-mark=ny1 table=main
/system note set show-at-login=no
