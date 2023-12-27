# Setup Xorg

## Install packages

Install the packages below

```bash
pkg install xorg
pkg install graphics/drm-kmod
```

## Configure Xorg

Add the code below to */etc/rc.conf*

```bash
kld_list="i915kms.ko"
```
