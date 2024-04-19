# Mikrotik Certified Padawan group's Mikrotik configurations

Our local group consists of MTC[NA, EWE, RE, ...] certified members. We gather once a month to ask for suggestions, share war stories, and solve networking related problems.

Next events and training: [https://mikrotikgyor.hu/registration.html](https://mikrotikgyor.hu/registration.html)

The supported devices are:

* [RB952Ui-5ac2nD](https://mikrotik.com/product/RB952Ui-5ac2nD) (hAP ac lite) with RouterOS 7.*

## Configurations

* [VLAN Switch](./vlan-switch/) - using a hAP ac lite and wifi. The hardware offloading is preserved.
* [Double CAPsMAN](./double-capsman/) - using a hAP ac lite running two CAPs managers a connecting CAP tunnels its traffic locally into VLANs.
* [4to4](./4to4/) - The idea is to do a pseudo-static ipv4 to ipv4 translation. Every port can give only one IP. Two versions: with netmap, with routes.

### Tools to use

* [Draw.io](https://www.drawio.com/) or [Draw.io snap](https://snapcraft.io/drawio)
* [Visual Studio Code](https://code.visualstudio.com/download)
  * [Cyberpunk Theme](https://marketplace.visualstudio.com/items?itemName=max-SS.cyberpunk) or [Winter is Coming Theme](https://marketplace.visualstudio.com/items?itemName=johnpapa.winteriscoming)
  * [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
  * [Markdown to PDF](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf)
  * [Mikrotik RouterOS script](https://marketplace.visualstudio.com/items?itemName=devMike.mikrotik-routeros-script) or [RouterOS configuration](https://marketplace.visualstudio.com/items?itemName=lautaportti.routeros-conf) or [RouterOS Syntax Highlighting](https://marketplace.visualstudio.com/items?itemName=cperezabo.routeros-syntax)
* [Git](https://git-scm.com/download/win) or package manager
* [Winbox](https://mikrotik.com/download) or [Winbox snap](https://snapcraft.io/winbox)

## Misc/For Fun

* [3D Rack Mount](./1u-bracket-rb260/) - 3D printed rack mount for [RB260GS](https://mikrotik.com/product/RB260GS), [RB260GSP](https://mikrotik.com/product/RB260GSP), or similar. Made by P. Gábor. STL and Ultimaker CAM (Cura) project file.
* [Lack Rack](http://eth-0.nl/lackrack.pdf) - Cheapest open rack concept. [Ikea link](https://www.ikea.com/hu/hu/p/lack-dohanyzoasztal-fekete-barna-80104268/#content)

## License / Re-use

The code and documentation is shared under [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/) license. If you use them in any work (training material, video material, ...) please give attribution.
