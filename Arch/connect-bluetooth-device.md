# Connect Bluetooth Devices

## How to Connect Devices

```sh
$ sudo pacman -S bluez bluez-utils
```

## How to power on automatically when power on my machine

```sh
$ sudo vim /etc/bluetooth/main.conf
```

*/etc/bluetooth/main.conf*
```sh
...
AutoEnable=true  # Un-comment and change to true
...
```

```sh
$ sudo systemctl enable bluetooth.service
$ sudo systemctl start bluetooth.service
$ bluetoothctl
bluetoothctl# select <Bluetooth Controller MAC Address>
bluetoothctl# power on
bluetoothctl# devices
bluetoothctl# scan on
bluetoothctl# agent on
bluetoothctl# pair <Bluetooth Device MAC Address>
bluetoothctl# trust <Bluetooth Device MAC Address>
bluetoothctl# connect <Bluetooth Device MAC Adress>
bluetoothctl# exit
$ 
```

## References

- https://wiki.archlinux.org/title/bluetooth
