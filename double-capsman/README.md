# Dual CAPsMAN configurations

* [hAP ac lite](dual_manager.rsc) - The CAPs manager running the old and the wave2 CAPsMAN.
* [hAP ax^2](capax_wave2.rsc) - configuration for a true wave2 CAP.
* [cAP ac - wireless](capac_wireless.rsc) - configuration for the old wireless CAP.
* [cAP ac - wifi-qcom-ac](capac_wave2.rsc) - configuration for the wave2-ified CAP.

The trick is in the VLAN part, as the gelded wave2 drivers for the "ac" devices do not support VLAN assignment from CAPsMAN.