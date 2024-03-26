# 4to4 translation

Imagine a factory environment, where each station has its own set of network ports. If we plug a device into the first port then we know that it is measuring air temperature. If we plug the same device into the third port, then it is measuring surface temperature. In case some device fails, then we can get one from the shelf and replace it without any network configuration.

Képzeljünk egy gyári környezetet, ahol minden állomásnak megvannak a saját hálózati portjai. Ha bedugunk egy eszközt az első portba, akkor tudjuk hogy az levegő hőmérsékletet mér. Ha ugyanezt az eszközt átdugjuk a harmadik portba, akkor felületi hőmérsékletről szolgáltat információ. Ha valamelyik eszköz tönkremenne, akkor csak a polcról le kell venni egyet és kicserélni, hálózati beállítás nélkül.

## Idea

* Define /30 networks to each port.
* Use DHCP servers to lease 1 address.
* Solution 1: Use srcnat and dstnat rules to netmap between IP addresses
* Solution 2: Use routes to send traffic to the /30 networks. A simpler solution:
* Solution 3: VLANs. Central management. - We did not complete this solution.

*Convert to jinja template and generate the configurations...* - real life usage, not done here.

## Solution 1: Netmap

![01-netmap](./hapaclite-img/4to4-01-netmap.drawio.png)

For convenience we will connect to the main router using the **wlan2** interface.

### 1.1. Configure wlan connection

Create a **bridge-wlan**, add **wlan1** and **wlan2** to the bridge.

```RouterOS
/interface bridge add name=bridge-wlan
/interface wireless set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless set [ find default-name=wlan2 ] band=5ghz-a/n/ac disabled=no frequency=5220 mode=station-bridge radio-name="07_G.Tam\E1s" ssid=Class5
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port add bridge=bridge-wlan interface=wlan1
/interface bridge port add bridge=bridge-wlan interface=wlan2
```

### 1.2. Add addresses

I was number 7, so x=7.

```RouterOS
/ip neighbor discovery-settings set discover-interface-list=all
/system identity set name="07_G.Tam\E1s"
/tool romon set enabled=yes
```

Configure static addresses. In RouterOS 7 the wlan2 interface will create multiple routes.

```RouterOS
/ip address add address=192.168.0.1/30 interface=ether1 network=192.168.0.0
/ip address add address=192.168.0.5/30 interface=ether2 network=192.168.0.4
/ip address add address=192.168.0.9/30 interface=ether3 network=192.168.0.8
/ip address add address=192.168.0.13/30 interface=ether4 network=192.168.0.12
/ip address add address=10.0.7.254/16 interface=bridge-wlan network=10.0.0.0
/ip address add address=10.0.7.2/16 interface=wlan2 network=10.0.0.0
/ip address add address=10.0.7.6/16 interface=wlan2 network=10.0.0.0
/ip address add address=10.0.7.10/16 interface=wlan2 network=10.0.0.0
/ip address add address=10.0.7.14/16 interface=wlan2 network=10.0.0.0
```

### 1.3. DHCP Servers

DHCP servers for the /30 size networks.

```RouterOS
/ip pool add name=dhcp_pool0 ranges=192.168.0.2
/ip pool add name=dhcp_pool1 ranges=192.168.0.6
/ip pool add name=dhcp_pool2 ranges=192.168.0.10
/ip pool add name=dhcp_pool3 ranges=192.168.0.14
/ip dhcp-server add address-pool=dhcp_pool0 interface=ether1 name=dhcp1
/ip dhcp-server add address-pool=dhcp_pool1 interface=ether2 name=dhcp2
/ip dhcp-server add address-pool=dhcp_pool2 interface=ether3 name=dhcp3
/ip dhcp-server add address-pool=dhcp_pool3 interface=ether4 name=dhcp4
/ip dhcp-server network add address=192.168.0.0/30 dns-server=192.168.0.1 gateway=192.168.0.1
/ip dhcp-server network add address=192.168.0.4/30 dns-server=192.168.0.5 gateway=192.168.0.5
/ip dhcp-server network add address=192.168.0.8/30 dns-server=192.168.0.9 gateway=192.168.0.9
/ip dhcp-server network add address=192.168.0.12/30 dns-server=192.168.0.13 gateway=192.168.0.13
```

### 1.4. Firewall and routes

This is where the magic happens.

```RouterOS
/ip firewall nat add action=netmap chain=srcnat src-address=192.168.0.0/24 to-addresses=10.0.7.0/24
/ip firewall nat add action=netmap chain=input dst-address=10.0.7.0-10.0.7.253 to-addresses=192.168.0.0/24
/ip route add disabled=no dst-address=0.0.0.0/0 gateway=10.0.255.254 routing-table=main suppress-hw-offload=no
```

## Solution 2: Routes

![02-routes](./hapaclite-img/4to4-02-route.drawio.png)

For convenience we will connect to the main router using the **wlan2** interface.

### 2.1. Configure wlan connection

Create a **bridge-wlan**, add **wlan1** and **wlan2** to the bridge.

```RouterOS
/interface bridge add name=bridge-wlan
/interface wireless set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless set [ find default-name=wlan2 ] band=5ghz-a/n/ac disabled=no frequency=5220 mode=station-bridge radio-name=02_Zoli ssid=Class5
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port add bridge=bridge-wlan interface=wlan1
/interface bridge port add bridge=bridge-wlan interface=wlan2
```

### Add addresses

```RouterOS
/ip neighbor discovery-settings set discover-interface-list=all
/system identity set name=02_Zoli
/tool romon set enabled=yes
```

Configure static addresses. In RouterOS 6 the wlan2 interfaces will create a single route.

```RouterOS
/ip address add address=10.0.2.254/16 interface=wlan2 network=10.0.0.0
/ip address add address=10.0.2.1/30 interface=ether1 network=10.0.2.0
/ip address add address=10.0.2.5/30 interface=ether2 network=10.0.2.4
/ip address add address=10.0.2.9/30 interface=ether3 network=10.0.2.8
/ip address add address=10.0.2.13/30 interface=ether4 network=10.0.2.12
```

### DHCP Servers

DHCP servers for the /30 size networks.

```RouterOS
/ip pool add name=eth1-pool2 ranges=10.0.2.2
/ip pool add name=eth2-pool2 ranges=10.0.2.6
/ip pool add name=eth3-pool2 ranges=10.0.2.10
/ip pool add name=eth4-pool2 ranges=10.0.2.14
/ip dhcp-server add address-pool=eth1-pool2 disabled=no interface=ether1 name=eth1-server
/ip dhcp-server add address-pool=eth2-pool2 disabled=no interface=ether2 name=eth2-server
/ip dhcp-server add address-pool=eth3-pool2 disabled=no interface=ether3 name=eth3-server
/ip dhcp-server add address-pool=eth4-pool2 disabled=no interface=ether4 name=eth4-server
/ip dhcp-server network add address=10.0.2.0/30 dns-server=10.0.255.254 gateway=10.0.2.1
/ip dhcp-server network add address=10.0.2.4/30 dns-server=10.0.255.254 gateway=10.0.2.5
/ip dhcp-server network add address=10.0.2.8/30 dns-server=10.0.255.254 gateway=10.0.2.9
/ip dhcp-server network add address=10.0.2.12/30 dns-server=10.0.255.254 gateway=10.0.2.13
```

### Firewall and routes

This is not where the magic happens.

```RouterOS
/ip route add distance=1 gateway=10.0.255.254
```

## Solution 3: VLANs. Central management
