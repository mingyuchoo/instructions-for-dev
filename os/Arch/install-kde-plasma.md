# Install KDE Plasma

## Install Packages

```bash
sudo pacman -Syyu plasma
sudo pacman -Syyu kde-applications
```

## Starting Plasma

```bash
# $HOME/.xinitrc
export DESKTOP_SESSION=plasma
exec startplasma-x11
```
