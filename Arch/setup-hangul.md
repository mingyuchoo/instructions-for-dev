# Setup Hangul

## How to install

```sh
sudo pacman -S scim libhangul
git clone https://aur.archlinux.org/scim-hangul.git
cd scim-hangul
makepkg -si
```

## How to configure keys in X11

```sh
scim-setup
```

## Configure .xinitrc

```sh
export XMODIFIERS="@im=SCIM"
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
scim -d
```
