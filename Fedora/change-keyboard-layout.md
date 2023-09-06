# Change Keyboard Layout

## Capslock as Control

Install `gnome-tweak-tool` first.

```bash
$ sudo dnf install gnome-tweak-tool
```

In the applet,
'Keyboard & mouse' > 'Additional Layout Options' button > 'Caps Lock behavior' > select 'Make Caps Lock an additional Ctrl'

## Emacs Input

In the `gnome-tweak-tool` ,
'Keyboard & mouse' > 'Additional Layout Options' button > enable 'Emacs Input'.


##  Enable Vim Keybinding in GNOME Text Editor

```bash
$ sudo apt install gnome-text-editor
$ gsettings set   org.gnome.TextEditor keybindings vim  # set to vim
$ gsettings reset org.gnome.TextEditor keybindings      # reset to default
```
