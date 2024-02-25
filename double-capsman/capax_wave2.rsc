# 2024-02-20 09:39:19 by RouterOS 7.13.5
# software id = DRFR-K1Q2
#
# model = C52iG-5HaxD2HaxD
# serial number = HD508BE5B1V
/interface bridge add name=bridge
/interface wifi
# managed by CAPsMAN
# mode: AP, SSID: Main5ax, channel: 5745/ax/Ceee
set [ find default-name=wifi1 ] configuration.manager=capsman .mode=ap disabled=no
# managed by CAPsMAN
# mode: AP, SSID: Main2ax, channel: 2412/ax/Ce
set [ find default-name=wifi2 ] configuration.manager=capsman .mode=ap disabled=no
/interface bridge port add bridge=bridge interface=ether2
/interface bridge port add bridge=bridge interface=ether3
/interface bridge port add bridge=bridge interface=ether4
/interface bridge port add bridge=bridge interface=ether5
/interface bridge port add bridge=bridge interface=wifi1
/interface bridge port add bridge=bridge interface=wifi2
/interface bridge port add bridge=bridge interface=ether1
/interface bridge port add bridge=bridge interface=dynamic
/interface wifi cap set discovery-interfaces=bridge enabled=yes
/ip dhcp-client add interface=bridge
/system identity set name=capax01
/system note set show-at-login=no
/tool romon set enabled=yes
