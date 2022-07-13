# Connect Bluetooth Devices

## How to Connect Devices

```sh
$ vsudo pacman -S bluez
$ sudo pacman -S bluez-utils
$ sudo vim /etc/bluetooth/main.conf
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


## References

- https://wiki.archlinux.org/title/bluetooth
