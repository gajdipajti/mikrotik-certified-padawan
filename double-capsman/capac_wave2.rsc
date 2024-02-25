# 2024-02-20 15:07:25 by RouterOS 7.13.5
# software id = N1L7-MYZF
#
# model = RBcAPGi-5acD2nD
# serial number = HFC09C82A1P
/interface bridge add name=bridge1
/interface bridge add name=bridge100
/interface bridge add name=bridge200
/interface wifi
# managed by CAPsMAN
# mode: AP, SSID: Main2ac, channel: 2412/n/Ce
set [ find default-name=wifi1 ] configuration.manager=capsman .mode=ap disabled=no
/interface wifi
# managed by CAPsMAN
# mode: AP, SSID: Main5ac, channel: 5240/ac/eeeC
set [ find default-name=wifi2 ] configuration.manager=capsman .mode=ap disabled=no
/interface vlan add interface=bridge1 name=vlan100 vlan-id=100
/interface vlan add interface=bridge1 name=vlan200 vlan-id=200
/ip hotspot profile set [ find default=yes ] html-directory=hotspot
/interface bridge port add bridge=bridge1 interface=ether2
/interface bridge port add bridge=bridge100 interface=wifi1
/interface bridge port add bridge=bridge100 interface=wifi2
/interface bridge port add bridge=bridge100 interface=vlan100
/interface bridge port add bridge=bridge200 interface=vlan200
/interface bridge port add bridge=bridge200 interface=dynamic pvid=200
/ip neighbor discovery-settings set discover-interface-list=!dynamic
/interface wifi cap set discovery-interfaces=bridge1 enabled=yes slaves-static=no
/ip dhcp-client add interface=ether1
/system clock set time-zone-name=Europe/Budapest
/system identity set name=capac01
/system note set show-at-login=no
/tool romon set enabled=yes
