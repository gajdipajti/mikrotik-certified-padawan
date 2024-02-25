# 2024-02-25 22:28:02 by RouterOS 7.14rc2
# software id = KNSD-I8YY
#
# model = RB952Ui-5ac2nD
# serial number = F43E0F67CA24
/caps-man channel add band=2ghz-g/n name=ch2
/caps-man channel add band=5ghz-n/ac name=ch5 skip-dfs-channels=yes
/caps-man datapath add local-forwarding=yes name=dpGuest vlan-id=200 vlan-mode=use-tag
/caps-man datapath add local-forwarding=yes name=dpMain vlan-id=100 vlan-mode=use-tag
/interface bridge add name=bridge
/interface wireless
# managed by CAPsMAN
# channel: 2412/20-Ce/gn(28dBm), SSID: Main2ac, local forwarding
set [ find default-name=wlan1 ] disabled=no ssid=MikroTik
/interface wireless
# managed by CAPsMAN
# channel: 5805/20-eeeC/ac(28dBm), SSID: Main5ac, local forwarding
set [ find default-name=wlan2 ] disabled=no ssid=MikroTik
/interface vlan add interface=bridge name=vlan100 vlan-id=100
/interface vlan add interface=bridge name=vlan200 vlan-id=200
/caps-man security add authentication-types=wpa2-psk encryption=aes-ccm name=secMain
/caps-man security add authentication-types=wpa2-psk encryption=aes-ccm name=secGuest
/caps-man configuration add channel=ch2 datapath=dpGuest name=cfgGuest2 security=secGuest ssid=Guest2ac
/caps-man configuration add channel=ch5 datapath=dpGuest name=cfgGuest5 security=secGuest ssid=Guest5ac
/caps-man configuration add channel=ch2 datapath=dpMain name=cfgMain2 security=secMain ssid=Main2ac
/caps-man configuration add channel=ch5 datapath=dpMain name=cfgMain5 security=secMain ssid=Main5ac
/caps-man interface add configuration=cfgMain2 disabled=no l2mtu=1600 mac-address=DC:2C:6E:4A:EF:04 master-interface=none name=capacManager-1 radio-mac=DC:2C:6E:4A:EF:04 radio-name=DC2C6E4AEF04
/caps-man interface add configuration=cfgGuest2 disabled=no l2mtu=1600 mac-address=DE:2C:6E:4A:EF:04 master-interface=capacManager-1 name=capacManager-1-1 radio-mac=00:00:00:00:00:00 radio-name=DE2C6E4AEF04
/caps-man interface add configuration=cfgMain5 disabled=no l2mtu=1600 mac-address=DC:2C:6E:4A:EF:03 master-interface=none name=capacManager-2 radio-mac=DC:2C:6E:4A:EF:03 radio-name=DC2C6E4AEF03
/caps-man interface add configuration=cfgGuest5 disabled=no l2mtu=1600 mac-address=DE:2C:6E:4A:EF:03 master-interface=capacManager-2 name=capacManager-2-1 radio-mac=00:00:00:00:00:00 radio-name=DE2C6E4AEF03
/interface list add name=WAN
/interface list add name=LAN
/interface wifi channel add band=2ghz-ax disabled=no name=ch2
/interface wifi channel add band=5ghz-ax disabled=no name=ch5 skip-dfs-channels=all
/interface wifi channel add band=2ghz-n disabled=no name=ch2ac
/interface wifi channel add band=5ghz-ac disabled=no name=ch5ac skip-dfs-channels=all
/interface wifi datapath add disabled=no name=dpMain vlan-id=100
/interface wifi datapath add disabled=no name=dpGuest vlan-id=200
/interface wifi security add authentication-types=wpa2-psk disabled=no name=secMain
/interface wifi security add authentication-types=wpa2-psk disabled=no name=secGuest
/interface wifi configuration add channel=ch2 datapath=dpMain disabled=no name=cfgMain2 security=secMain ssid=Main2ax
/interface wifi configuration add channel=ch5 datapath=dpMain disabled=no name=cfgMain5 security=secMain ssid=Main5ax
/interface wifi configuration add channel=ch2 datapath=dpGuest disabled=no name=cfgGuest2 security=secGuest ssid=Guest2ax
/interface wifi configuration add channel=ch5 datapath=dpGuest disabled=no name=cfgGuest5 security=secGuest ssid=Guest5ax
/interface wifi configuration add channel=ch5ac disabled=no name=cfgMain5ac security=secMain ssid=Main5ac
/interface wifi configuration add channel=ch5ac disabled=no name=cfgGuest5ac security=secGuest ssid=Guest5ac
/interface wifi configuration add channel=ch2ac disabled=no name=cfgGuest2ac security=secGuest ssid=Guest2ac
/interface wifi configuration add channel=ch2ac disabled=no name=cfgMain2ac security=secMain ssid=Main2ac
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=poolWired ranges=192.168.88.10-192.168.88.254
/ip pool add name=pool100 ranges=192.168.100.100-192.168.100.199
/ip pool add name=pool200 ranges=192.168.200.100-192.168.200.199
/ip dhcp-server add address-pool=poolWired interface=bridge lease-time=10m name=dhcpWired
/ip dhcp-server add address-pool=pool100 interface=vlan100 name=dhcpMain
/ip dhcp-server add address-pool=pool200 interface=vlan200 name=dhcpGuest
/ip smb users set [ find default=yes ] read-only=yes
/caps-man manager set enabled=yes
/caps-man provisioning add action=create-enabled hw-supported-modes=gn identity-regexp=capac* master-configuration=cfgMain2 name-format=identity slave-configurations=cfgGuest2
/caps-man provisioning add action=create-enabled hw-supported-modes=ac identity-regexp=capac* master-configuration=cfgMain5 name-format=identity slave-configurations=cfgGuest5
/interface bridge port add bridge=bridge disabled=yes interface=ether1 internal-path-cost=10 path-cost=10
/interface bridge port add bridge=bridge interface=ether2 internal-path-cost=10 path-cost=10
/interface bridge port add bridge=bridge interface=ether3 internal-path-cost=10 path-cost=10
/interface bridge port add bridge=bridge interface=ether4 internal-path-cost=10 path-cost=10
/interface bridge port add bridge=bridge interface=ether5 internal-path-cost=10 path-cost=10
/interface bridge port add bridge=bridge interface=wlan1 internal-path-cost=10 path-cost=10
/interface bridge port add bridge=bridge interface=wlan2 internal-path-cost=10 path-cost=10
/interface bridge port add bridge=bridge interface=dynamic
/ip neighbor discovery-settings set discover-interface-list=LAN
/interface list member add interface=bridge list=LAN
/interface list member add interface=ether1 list=WAN
/interface sstp-server server set ciphers=aes256-sha
/interface wifi capsman set enabled=yes interfaces=bridge package-path="" require-peer-certificate=no upgrade-policy=none
/interface wifi provisioning add action=create-enabled disabled=no identity-regexp=capax* master-configuration=cfgMain2 name-format=%I-2GHz slave-configurations=cfgGuest2 supported-bands=2ghz-ax,2ghz-n
/interface wifi provisioning add action=create-enabled disabled=no identity-regexp=capac* master-configuration=cfgMain2ac name-format=%I-2GHz slave-configurations=cfgGuest2ac supported-bands=2ghz-n
/interface wifi provisioning add action=create-enabled disabled=no identity-regexp=capax* master-configuration=cfgMain5 name-format=%I-5GHz slave-configurations=cfgGuest5 supported-bands=5ghz-ax,5ghz-ac
/interface wifi provisioning add action=create-enabled disabled=no identity-regexp=capac* master-configuration=cfgMain5ac name-format=%I-5GHz slave-configurations=cfgGuest5ac supported-bands=5ghz-ac
/interface wireless cap
# 
set bridge=bridge caps-man-addresses=127.0.0.1 enabled=yes interfaces=wlan1,wlan2
/ip address add address=192.168.88.1/24 interface=bridge network=192.168.88.0
/ip address add address=192.168.100.254/24 interface=vlan100 network=192.168.100.0
/ip address add address=192.168.200.254/24 interface=vlan200 network=192.168.200.0
/ip dhcp-client add interface=ether1
/ip dhcp-server network add address=192.168.88.0/24 dns-server=192.168.88.1 gateway=192.168.88.1
/ip dhcp-server network add address=192.168.100.0/24 dns-server=192.168.100.254 gateway=192.168.100.254
/ip dhcp-server network add address=192.168.200.0/24 dns-server=192.168.200.254 gateway=192.168.200.254
/ip dns set allow-remote-requests=yes
/ip smb shares set [ find default=yes ] directory=pub
#error exporting "/ip/ssh" (timeout)
/system clock set time-zone-name=Europe/Budapest
/system identity set name=capacManager
/system note set show-at-login=no
/system ntp client set enabled=yes
/tool romon set enabled=yes
