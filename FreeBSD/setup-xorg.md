# Setup Xorg

## Install packages

Install the packages below

```sh
pkg install xorg
pkg install graphics/drm-kmod
```

## Configure Xorg

Add the code below to */etc/rc.conf*

```sh
kld_list="i915kms.ko"
```
