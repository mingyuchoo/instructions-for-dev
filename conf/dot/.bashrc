# #############################################################################
# `.bashrc`
#
# This file starts in an environment where you are already logged in.
# For example, when opening a new terminal window or tab in a terminal emulator.
#   - Set prompt
#   - Set aliases
#   - Set functions
#   - Set scripts ex) `eval "$(...)"`
# #############################################################################

stty erase ^H

# Prompt
PS1='[\u@\h \W]\$ '

# Aliases
alias df='df -h'
alias ls='ls --color=auto'
alias ll='ls -la'
alias ed='emacs --daemon'
alias ec='emacsclient -c'
alias vi="nvim"
alias vim="nvim"
alias xclip="xclip -selection clipboard"
alias xsel="xsel --clipboard --input"

# Scripts
[[ -f $HOME/.cargo/env              ]] && . $HOME/.cargo/env
[[ -f $HOME/.ghcup/env              ]] && . $HOME/.ghcup/env
[[ -f $HOME/.opam/opam-init/init.sh ]] && . $HOME/.opam/opam-init/init.sh
[[ -f $HOME/.venv/bin/activate      ]] && . $HOME/.venv/bin/activate
[[ -s $HOME/.nvm/nvm.sh             ]] && . $HOME/.nvm/nvm.sh
[[ -s $HOME/.nvm/bash_completion    ]] && . $HOME/.nvm/bash_completion

