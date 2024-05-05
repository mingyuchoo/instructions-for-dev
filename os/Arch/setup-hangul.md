# Setup Hangul

## Using IBUS

```bash
sudo pacman -S ibus ibus-hangul
ibus-daemon -drx
```

### Configure .xinitrc

```bash
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -drx
```

## Using SCIM

```bash
sudo pacman -S scim libhangul
git clone https://aur.archlinux.org/scim-hangul.git
cd scim-hangul
makepkg -si
```

### How to configure keys in X11

```bash
scim-setup
```

### Configure .xinitrc

```bash
export XMODIFIERS="@im=SCIM"
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
scim -d
```
