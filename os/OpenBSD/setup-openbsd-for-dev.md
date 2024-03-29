# How to set up OpenBSD for developers


## `doas` command

- <https://www.vultr.com/docs/introduction-to-doas-on-openbsd/>

```bash
openbsd$ ls
openbsd$ doas -u root ls
doas: doas is not enabled, /etc/doas.conf: No such file or directory

openbsd$ su -
Password:
openbsd# vi /etc/doas.conf
```

`/etc/doas.conf`

```
permit persist :wheel
```

```bash
openbsd# exit
openbsd$ doas -u root ls
doas (me@openbsd.Davolink) password:
.Xauthority         .cvsrc              .profile
.Xdefaults          .login              .ssh
.cshrc              .mailrc             .xsession-errors
```

## Fix `pkg_add` TLS handshake failure: ocsp ...

```bash
openbsd$ su -
openbsd# vi /etc/installurl
```

`/etc/installurl`

```
# https://cdn.openbsd.org/pub/OpenBSD
https://ftp.openbsd.org/pub/OpenBSD
```

## To keep up-to-date

- <https://rakhesh.com/linux-bsd/keeping-openbsd-up-to-date/>

```bash
# apply OS patches
openbsd$ doas -u root syspatch

# update installed packages and their dependencies
openbsd$ doas -u root pkg_add -Uu
```

### To upgrade between releases

```bash
# upgrade the OS
openbsd$ doas -u root sysmerge

# update the OS config files
openbsd$ doas -u root sysmerge -d

# update installed packages and their dependencies
openbsd$ doas -u root pkg_add -Uu

# reboot
openbsd$ doas -u root reboot
```

## Essential packages to install for developers

* bash
* wget
* curl
* tree
* git
* vim
* emacs

## Change default $SHELL for my account

```bash
openbsd$ which bash
/usr/local/bin/bash
openbsd$ chsh -s /usr/local/bin/bash
```

# set Prompt for Ksh

`.profile` for ksh

```bash
export PS1='[\t \d] \u@\h:\w\$ '
```
