# Ubuntu

## Change Prompt colors

Edit `PS1` environment variable in `.bashrc` file

```sh
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
```

## How to change start up shell to `tmux`

add below to `.bashrc`

```sh
...

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
```


## How to change start up shell to `zellij`

add below to `.bashrc`

```sh
...

if command -v zellij &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ zellij ]] && [ -z "$ZELLIJ" ]; then
  exec zellij
fi

alias xclip='xclip -selection clipbaord -i'
```
