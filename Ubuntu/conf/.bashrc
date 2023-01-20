case $- in
    *i*) ;;
      *) return;;
esac

EDITOR=nvim
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\\n$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias df='df -h'
alias e='emacsclient -nw'
alias ec='emacsclient -nw'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias n3='nnn'
alias pn='pnpm'
alias zj='zellij'
alias tree-l2='tree -d -L 2'


if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh" 
source "$NVM_DIR/bash_completion" 

source "$HOME/.ghcup/env"
source "$HOME/.cargo/env"
source "$HOME/tools/venv/bin/activate"
source "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
source "$HOME/.nix-profile/etc/profile.d/nix.sh"

PATH="$HOME/bin:/usr/local/go/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.deno/bin:$PATH"
PATH="$HOME/.emacs.d/bin:$PATH"
PATH="$HOME/.jabba/bin:$HOME/.jabba/jdk/default/bin:$PATH"
PATH="$HOME/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH

export JAVA_HOME="$HOME/.jabba/jdk/openjdk@1.11.0"

eval "$(opam env)"
eval "$(direnv hook bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# start up zellij
# if command -v zellij &> /dev/null \
#     && [ -n "$PS1" ] \
#     && [[ ! "$TERM" =~ screen ]] \
#     && [[ ! "$TERM" =~ zellij ]] \
#     && [ -z "$ZELLIJ" ]; then
#   exec zellij
# fi

# run emacs daemon if NOT running
pidof emacs > /dev/null || emacs --daemon

