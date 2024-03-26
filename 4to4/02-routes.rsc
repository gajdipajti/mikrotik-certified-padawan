# jan/02/1970 01:54:52 by RouterOS 6.49.13
# software id = 40RU-RQA5
#
# model = RB952Ui-5ac2nD
# serial number = F43E0FE8B39B
/interface wireless set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless set [ find default-name=wlan2 ] band=5ghz-a/n/ac disabled=no frequency=5220 mode=station-bridge radio-name=02_Zoli ssid=Class5
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile set [ find default=yes ] html-directory=hotspot
/ip pool add name=eth1-pool ranges=192.168.0.2
/ip pool add name=eth2-pool ranges=192.168.0.6
/ip pool add name=eth3-pool ranges=192.168.0.10
/ip pool add name=eth4-pool ranges=192.168.0.14
/ip pool add name=eth1-pool2 ranges=10.0.2.2
/ip pool add name=eth2-pool2 ranges=10.0.2.6
/ip pool add name=eth3-pool2 ranges=10.0.2.10
/ip pool add name=eth4-pool2 ranges=10.0.2.14
/ip dhcp-server add address-pool=eth1-pool2 disabled=no interface=ether1 name=eth1-server
/ip dhcp-server add address-pool=eth2-pool2 disabled=no interface=ether2 name=eth2-server
/ip dhcp-server add address-pool=eth3-pool2 disabled=no interface=ether3 name=eth3-server
/ip dhcp-server add address-pool=eth4-pool2 disabled=no interface=ether4 name=eth4-server
/ip neighbor discovery-settings set discover-interface-list=!dynamic
/ip address add address=192.168.0.1/30 disabled=yes interface=ether1 network=192.168.0.0
/ip address add address=10.0.2.5/30 interface=ether2 network=10.0.2.4
/ip address add address=192.168.0.9/30 disabled=yes interface=ether3 network=192.168.0.8
/ip address add address=192.168.0.13/30 disabled=yes interface=ether4 network=192.168.0.12
/ip address add address=10.0.2.254/16 interface=wlan2 network=10.0.0.0
/ip address add address=10.0.2.2/16 disabled=yes interface=wlan2 network=10.0.0.0
/ip address add address=10.0.2.6/16 disabled=yes interface=wlan2 network=10.0.0.0
/ip address add address=10.0.2.10/16 disabled=yes interface=wlan2 network=10.0.0.0
/ip address add address=10.0.2.14/16 disabled=yes interface=wlan2 network=10.0.0.0
/ip address add address=10.0.2.1/30 interface=ether1 network=10.0.2.0
/ip address add address=192.168.0.5/30 disabled=yes interface=ether2 network=192.168.0.4
/ip address add address=10.0.2.9/30 interface=ether3 network=10.0.2.8
/ip address add address=10.0.2.13/30 interface=ether4 network=10.0.2.12
/ip dhcp-server network add address=10.0.2.0/30 dns-server=10.0.255.254 gateway=10.0.2.1
/ip dhcp-server network add address=10.0.2.4/30 dns-server=10.0.255.254 gateway=10.0.2.5
/ip dhcp-server network add address=10.0.2.8/30 dns-server=10.0.255.254 gateway=10.0.2.9
/ip dhcp-server network add address=10.0.2.12/30 dns-server=10.0.255.254 gateway=10.0.2.13
/ip dhcp-server network add address=192.168.0.0/30 dns-server=10.0.255.254 gateway=192.168.0.1
/ip dhcp-server network add address=192.168.0.4/30 dns-server=10.0.255.254 gateway=192.168.0.5
/ip dhcp-server network add address=192.168.0.8/30 dns-server=10.0.255.254 gateway=192.168.0.9
/ip dhcp-server network add address=192.168.0.12/30 dns-server=10.0.255.254 gateway=192.168.0.13
/ip firewall nat add action=netmap chain=srcnat disabled=yes src-address=192.168.0.0/28 to-addresses=10.0.2.0/28
/ip firewall nat add action=netmap chain=dstnat disabled=yes dst-address=10.0.2.0/28 to-addresses=192.168.0.0/28
/ip route add distance=1 gateway=10.0.255.254
/system identity set name=02_Zoli
