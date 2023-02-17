EDITOR=emacs

export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.emacs.d/bin:$PATH"


[[ -f ~/.bashrc                  ]] && . ~/.bashrc
[[ -f ~/.cargo/env               ]] && . ~/.cargo/env
[[ -f ~/.ghcup/env               ]] && . ~/.ghcup/env
[[ -f ~/.opam/opam-init/init.sh  ]] && . ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
[[ -f ~/tools/venv/bin/activate  ]] && . ~/tools/venv/bin/activate
[[ -s "$NVM_DIR/nvm.sh"          ]] && . "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"
