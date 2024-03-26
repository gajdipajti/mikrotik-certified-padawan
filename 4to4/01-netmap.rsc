# 2024-03-25 05:19:33 by RouterOS 7.14.1
# software id = KNSD-I8YY
#
# model = RB952Ui-5ac2nD
# serial number = F43E0F67CA24
/interface bridge add name=bridge-wlan
/interface wireless set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless set [ find default-name=wlan2 ] band=5ghz-a/n/ac disabled=no frequency=5220 mode=station-bridge radio-name="07_G.Tam\E1s" ssid=Class5
/interface wireguard add listen-port=21828 mtu=1420 name=wireguard1 private-key="6MMyHfHHE/40OLw73hFZMXSCj5XcICBNEFqvem6EqkM="
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile set [ find default=yes ] html-directory=hotspot
/ip pool add name=dhcp_pool0 ranges=192.168.0.2
/ip pool add name=dhcp_pool1 ranges=192.168.0.6
/ip pool add name=dhcp_pool2 ranges=192.168.0.10
/ip pool add name=dhcp_pool3 ranges=192.168.0.14
/ip dhcp-server add address-pool=dhcp_pool0 interface=ether1 name=dhcp1
/ip dhcp-server add address-pool=dhcp_pool1 interface=ether2 name=dhcp2
/ip dhcp-server add address-pool=dhcp_pool2 interface=ether3 name=dhcp3
/ip dhcp-server add address-pool=dhcp_pool3 interface=ether4 name=dhcp4
/routing id add disabled=no id=10.0.20.10 name=id-10 select-dynamic-id=""
/routing ospf instance add disabled=no name=ospf-instance-1 router-id=id-10
/routing ospf area add area-id=0.0.0.1 disabled=no instance=ospf-instance-1 name=ospf-area-1
/interface bridge port add bridge=bridge-wlan interface=wlan1
/interface bridge port add bridge=bridge-wlan interface=wlan2
/ip neighbor discovery-settings set discover-interface-list=all
/interface wireguard peers add allowed-address=0.0.0.0/0 endpoint-address=10.0.0.1 endpoint-port=13231 interface=wireguard1 persistent-keepalive=1m public-key="zRKtD37Ld5KCL0M3Jv+8Y3V3qPS6lY5+EGkVJvIlPiM="
/ip address add address=10.0.20.10/24 interface=wireguard1 network=10.0.20.0
/ip address add address=192.168.0.1/30 interface=ether1 network=192.168.0.0
/ip address add address=192.168.0.5/30 interface=ether2 network=192.168.0.4
/ip address add address=192.168.0.9/30 interface=ether3 network=192.168.0.8
/ip address add address=192.168.0.13/30 interface=ether4 network=192.168.0.12
/ip address add address=10.0.7.254/16 interface=bridge-wlan network=10.0.0.0
/ip address add address=10.0.7.2/16 interface=wlan2 network=10.0.0.0
/ip address add address=10.0.7.6/16 interface=wlan2 network=10.0.0.0
/ip address add address=10.0.7.10/16 interface=wlan2 network=10.0.0.0
/ip address add address=10.0.7.14/16 interface=wlan2 network=10.0.0.0
/ip dhcp-client add interface=ether1
/ip dhcp-server network add address=192.168.0.0/30 dns-server=192.168.0.1 gateway=192.168.0.1
/ip dhcp-server network add address=192.168.0.4/30 dns-server=192.168.0.5 gateway=192.168.0.5
/ip dhcp-server network add address=192.168.0.8/30 dns-server=192.168.0.9 gateway=192.168.0.9
/ip dhcp-server network add address=192.168.0.12/30 dns-server=192.168.0.13 gateway=192.168.0.13
/ip firewall nat add action=netmap chain=srcnat src-address=192.168.0.0/24 to-addresses=10.0.7.0/24
/ip firewall nat add action=netmap chain=input dst-address=10.0.7.0-10.0.7.253 to-addresses=192.168.0.0/24
/ip route add disabled=no dst-address=0.0.0.0/0 gateway=10.0.255.254 routing-table=main suppress-hw-offload=no
/routing ospf interface-template add area=ospf-area-1 disabled=no interfaces=wireguard1 type=ptmp
/routing ospf static-neighbor add address=10.0.20.1%wireguard1 area=ospf-area-1 disabled=no
/system identity set name="07_G.Tam\E1s"
/system note set show-at-login=no
/tool romon set enabled=yes
