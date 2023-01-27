# Setup Daul Monitor and Resolutions


create `/etc/X11/xorg.conf.d/10-monitor.conf` file.

## `/etc/X11/xorg.conf.d/10-monitor.conf`

```bash
Section "Monitor"
	Identifier	"eDP-1"
	Option		"Primary"	"true"
	Option		"PreferredMode"	"2560x1440_60.00"
	Option		"DPMS"		"true"
EndSection

Section "Monitor"
	Identifier	"HDMI-2"
	Option		"RightOf" "eDP-1"
	Option		"PreferredMode" "3840x2160_30.00"
	Option		"DPMS"		"true"
EndSection
```

