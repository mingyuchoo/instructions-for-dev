# Connect Bluetooth Devices

## How to Connect Devices

```bash
$ sudo pacman -S bluez bluez-utils
```

## How to power on automatically when power on my machine

```bash
$ sudo vim /etc/bluetooth/main.conf
```

*/etc/bluetooth/main.conf*
```bash
...
AutoEnable=true  # Un-comment and change to true
...
```

```bash
$ sudo systemctl enable bluetooth.service
$ sudo systemctl start bluetooth.service
$ bluetoothctl
bluetoothctl# select <Bluetooth Controller MAC Address>
bluetoothctl# power on
bluetoothctl# devices
bluetoothctl# scan on
bluetoothctl# pair <Bluetooth Device MAC Address>
bluetoothctl# trust <Bluetooth Device MAC Address>
bluetoothctl# connect <Bluetooth Device MAC Adress>
bluetoothctl# exit
$
```

## References

- https://wiki.archlinux.org/title/bluetooth
