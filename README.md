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

## License / Re-use

The code and documentation is shared under [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/) license. If you use them in any work (training material, video material, ...) please give attribution.
