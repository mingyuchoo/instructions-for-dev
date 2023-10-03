# .bash_profile

umask 022

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
fi


[[ -f "$HOME/.cargo/env"  ]] && source "$HOME/.cargo/env"
[[ -f "$HOME/.ghcup/env"  ]] && source "$HOME/.ghcup/env"
[[ -f "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# for homebrew
eval "$(/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
