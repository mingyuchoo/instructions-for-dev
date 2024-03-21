[[ $- != *i* ]] && return

stty erase ^H

PS1='[\u@\h \W]\$ '

alias df='df -h'
alias dir='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -la'
alias nnn='nnn -e'
alias grep='grep --color=auto'
alias emacs='emacs -nw'

# eval "$(opam env)"
# eval "$(direnv hook bash)"
