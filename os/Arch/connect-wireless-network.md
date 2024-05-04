# Connect Wirelss Network

## Using NetworkManager in Desktop

```bash
sudo pacman -Syyu networkmanager
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
```

## Connect Wireless Manually in Console

```bash
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
