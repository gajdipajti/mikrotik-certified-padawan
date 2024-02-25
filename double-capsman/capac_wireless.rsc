# 2024-02-20 10:39:11 by RouterOS 7.13.5
# software id = N1L7-MYZF
#
# model = RBcAPGi-5acD2nD
# serial number = HFC09C82A1P
/interface bridge add name=bridge
/interface wireless
# managed by CAPsMAN
# channel: 2442/20-eC/gn(28dBm), SSID: Main2ac, local forwarding
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-XX disabled=no distance=indoors frequency=auto installation=indoor mode=ap-bridge ssid=MikroTik-B75759 wireless-protocol=802.11
/interface wireless
# managed by CAPsMAN
# channel: 5805/20-eeeC/ac(27dBm), SSID: Main5ac, local forwarding
set [ find default-name=wlan2 ] band=5ghz-a/n/ac channel-width=20/40/80mhz-XXXX disabled=no distance=indoors frequency=auto installation=indoor mode=ap-bridge ssid=MikroTik-B75759 wireless-protocol=802.11
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile set [ find default=yes ] html-directory=hotspot
/interface bridge port add bridge=bridge interface=ether2
/interface bridge port add bridge=bridge interface=wlan1
/interface bridge port add bridge=bridge interface=wlan2
/interface bridge port add bridge=bridge interface=ether1
/ip neighbor discovery-settings set discover-interface-list=!dynamic
/interface wireless cap set bridge=bridge discovery-interfaces=bridge enabled=yes interfaces=wlan1,wlan2
/ip dhcp-client add interface=bridge
/system clock set time-zone-name=Europe/Budapest
/system identity set name=capac01
/system note set show-at-login=no
/tool romon set enabled=yes
