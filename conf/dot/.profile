umask 022


if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

export HISTSIZE=10000
export HISTFILESIZE=10000
export EDITOR=emacs
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.emacs.d/bin:$PATH"


[[ -f $HOME/.bashrc                 ]] && . $HOME/.bashrc
[[ -f $HOME/.cargo/env              ]] && . $HOME/.cargo/env
[[ -f $HOME/.ghcup/env              ]] && . $HOME/.ghcup/env
[[ -f $HOME/.opam/opam-init/init.sh ]] && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
[[ -f $HOME/tools/venv/bin/activate ]] && . $HOME/tools/venv/bin/activate
[[ -s "$NVM_DIR/nvm.sh"             ]] && . "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion"    ]] && . "$NVM_DIR/bash_completion"