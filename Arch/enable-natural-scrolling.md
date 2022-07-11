# Enable Natural Scrolling

```sh
$ cat /etc/X11/xorg.conf.d/30-touchpad.conf

Section "InputClass"
        Identifier "SynPS/2 Synaptics TouchPad"
        MatchIsTouchpad "true"
        Driver "libiinput"
        Option "NaturalScrolling" "true"
EndSection
```
