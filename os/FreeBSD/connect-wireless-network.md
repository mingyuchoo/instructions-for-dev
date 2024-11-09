# Connect Wireless Network

## Find out Network Device

```bash
pciconf -lv | grep -A1 -B3 network
```

## Load Drivers

Add the code below to */boot/loader.conf*

```bash
if_iwm_load="YES"
iwm8265fm_load="YES"
wlan_ccmp_load="YES"
wlan_tkip_load="YES"
```

## Configure Wireless Network

Add the code below to */etc/rc.conf*

```bash
background_dhclient="YES"
wlans_iwm0="wlan0"
ifconfig_wlan0="WPA SYNCDHCP powersave"
```

## Configure WPA Support

Add the code below to */etc/wpa_supplicant.conf*

```bash
ctrl_interface=/var/run/wpa_supplicant
eapol_version=2
ap_scan=1
fast_reauth=1
network={
	ssid="{my-SSID}"
	psk="{my-SSID-password}"
}
```
