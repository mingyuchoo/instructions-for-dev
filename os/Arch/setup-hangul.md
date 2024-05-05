# Setup Hangul

## Using IBUS

```bash
sudo pacman -S ibus ibus-hangul
```

### Case 1) in Wayland

IBus should be called from the desktop session in Wayland.
For KDE, you can launch 'systemsettings5' utility and go to "Input Devices"-> "Virtual Keyboard" section
and select "IBus Wayland" icon
and click "Apply" button to configure IBus in Wayland.
For other desktop sessions, you can copy the 'Exec=' line
in org.freedesktop.IBus.Panel.Wayland.Gtk3.desktop file to a configuration file of the session.
Please refer each document about the "Wayland input method" configuration.
Before you configure the "Wayland input method", you should make sure that
QT_IM_MODULE and GTK_IM_MODULE environment variables are unset in the desktop session.

**ISSUE**

When run IBUS in Wayland,
keyboard repeatation functionality does not work.

### Case 2) in X11


Configure `$HOME/.xprofile`


```bash
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -drx
```
