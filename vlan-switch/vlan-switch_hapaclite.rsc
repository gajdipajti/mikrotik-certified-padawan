# 2024-02-25 08:12:42 by RouterOS 7.14rc2
# software id = KNSD-I8YY
#
# model = RB952Ui-5ac2nD
# serial number = F43E0F67CA24
/interface bridge add name=bridge1
/interface ethernet set [ find default-name=ether1 ] name=ether1.trunk
/interface ethernet set [ find default-name=ether2 ] name=ether2.v10
/interface ethernet set [ find default-name=ether3 ] name=ether3.v20
/interface ethernet set [ find default-name=ether4 ] name=ether4.mgmt
/interface wireless set [ find default-name=wlan1 ] band=2ghz-onlyn country=hungary disabled=no frequency=2472 installation=indoor mode=ap-bridge name=wlan1.v10 radio-name="Mikrotik VLAN10" ssid=V10 vlan-id=10 vlan-mode=use-tag wmm-support=enabled wps-mode=disabled
/interface wireless set [ find default-name=wlan2 ] band=5ghz-onlyac channel-width=20/40/80mhz-eCee country=hungary disabled=no frequency=5200 installation=indoor mode=ap-bridge name=wlan2.v20 radio-name="MikroTik VLAN20" ssid=V20 vlan-id=20 vlan-mode=use-tag wmm-support=enabled wps-mode=disabled
/interface vlan add interface=bridge1 name=MGMT vlan-id=1
/interface vlan add interface=bridge1 name=vlan10 vlan-id=10
/interface vlan add interface=bridge1 name=vlan20 vlan-id=20
/interface ethernet switch port set 0 default-vlan-id=1 vlan-header=add-if-missing vlan-mode=secure
/interface ethernet switch port set 1 default-vlan-id=10 vlan-header=always-strip vlan-mode=secure
/interface ethernet switch port set 2 default-vlan-id=20 vlan-header=always-strip vlan-mode=secure
/interface ethernet switch port set 3 default-vlan-id=1 vlan-header=always-strip vlan-mode=secure
/interface ethernet switch port set 5 vlan-mode=secure
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile set [ find default=yes ] html-directory=hotspot
/ip smb users set [ find default=yes ] read-only=yes
/interface bridge port add bridge=bridge1 interface=ether1.trunk
/interface bridge port add bridge=bridge1 interface=ether2.v10
/interface bridge port add bridge=bridge1 interface=ether3.v20
/interface bridge port add bridge=bridge1 interface=ether4.mgmt
/interface bridge port add bridge=bridge1 interface=wlan1.v10
/interface bridge port add bridge=bridge1 interface=wlan2.v20
/ip firewall connection tracking set udp-timeout=10s
/ip neighbor discovery-settings set discover-interface-list=!dynamic
/interface ethernet switch vlan add ports=ether1.trunk,ether2.v10,switch1-cpu switch=switch1 vlan-id=10
/interface ethernet switch vlan add ports=ether1.trunk,ether3.v20,switch1-cpu switch=switch1 vlan-id=20
/interface ethernet switch vlan add ports=ether1.trunk,ether4.mgmt,switch1-cpu switch=switch1 vlan-id=1
/interface sstp-server server set ciphers=aes256-sha
/ip dhcp-client add interface=MGMT
/ip dhcp-client add add-default-route=no interface=vlan10 use-peer-dns=no use-peer-ntp=no
/ip dhcp-client add add-default-route=no interface=vlan20 use-peer-dns=no use-peer-ntp=no
/ip dhcp-client add add-default-route=no interface=bridge1 use-peer-dns=no use-peer-ntp=no
/ip smb shares set [ find default=yes ] directory=pub
/system clock set time-zone-name=Europe/Budapest
/system note set show-at-login=no
/system ntp client set enabled=yes
/system ntp client servers add address=3.openwrt.pool.ntp.org
/system ntp client servers add address=1.openwrt.pool.ntp.org
/system ntp client servers add address=2.openwrt.pool.ntp.org
/system ntp client servers add address=0.openwrt.pool.ntp.org
/system package update set channel=development
/tool romon set enabled=yes
