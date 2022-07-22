# Connect Wireless in Arch Linux

```sh
iwclt

adapter list
adpater phy0 set-property Powered on

device list

station wlan0 scan
station wlan0 get-networks
station wlan0 connect <SSID>
station wlan0 show

exit
```
