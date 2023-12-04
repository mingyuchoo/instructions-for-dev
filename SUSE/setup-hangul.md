# Setup Hangul

## How to install

```bash
sudo zypper fcitx fcitx-hangul
sudo vim /etc/sysconfig/language
```

## How to set up

```bash
#/etc/sysconfig/language

INPUT_METHOD="fcitx"
```

```bash
vim $HOME/.bashrc
```

```bash
# $HOME/.bashrc

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
```

Reboot System.

In taskbar, select fcitx
> configure
> Remove "Keyboard - English(US)
> [+] add Input Method...
> Hangul
> [+] Add
> Apply

Close the window

## How to toggle languages

type 'C-SPC'

##  References

- https://m.blog.naver.com/keunsik114/222049639999
