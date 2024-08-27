# README

## How to install i3wm

### For Debian/Ubuntu

```bash
sudo apt install -y xorg lightdm lightdm-gtk-greeter i3-wm i3lock i3status i3blocks dmenu terminator xrandr feh
sudo apt install -y fonts-font-awesome
```

### For Arch Linux

```bash
sudo pacman -S xorg lightdm lightdm-gtk-greeter i3-wm i3lock i3status i3blocks dmenu terminator xrandr feh
sudo pacman -S ttf-font-awesome
```

## How to start i3wm

Restart your desktop

### For Debian/Ubuntu

```bash
TODO:
```

### For Arch Linux

```bash
TODO:
```

## How to modify your configuration file

```bash
cd $HOME
vi ./config/i3/config

```

## How to use i3

- Opening terminals: `$mod+Enter`
- Moving around:
  - left: `$mod+j`
  - down: `$mod+k`
  - up: `$mod+l`
  - right: `$mod+;`
- Changing the container layout
  - toggle: `$mod+e`
  - stackked: `$mod+s` 
  - tabbed: `$mod+w`
- Toggling fullscreen: `$mod+f`
- Opening `dmenu`: `$mod+d`
- Closing windows: `$mod+Shift+q`
- Using workspaces: `$mod+num`
  - Moving windows to workspaces: `$mod+Shift+num`
- Restarting i3: `$mod+Shift+r`
- Exiting i3: `$mod+Shift+e`
- Floating: `$mod+Shift+Space`

## References

- [The Ultimate Guide to i3 Customization in Linux](https://itsfoss.com/i3-customization/)
- [i3 User's Guide](https://i3wm.org/docs/userguide.html)
