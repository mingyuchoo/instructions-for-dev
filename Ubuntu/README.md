# Ubuntu

## Change Prompt colors

Edit `PS1` environment variable in `.bashrc` file

```sh
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
```
