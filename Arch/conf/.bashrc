[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias df='df -h'
alias dir='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -la'
alias n3='nnn'
alias grep='grep --color=auto'
alias emacs='emacs -nw'

# eval "$(opam env)"
# eval "$(direnv hook bash)"
