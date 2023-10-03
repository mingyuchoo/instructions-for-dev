# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Aliases
alias ls="ls -F"
alias ll="ls -l"
alias emacs="emacs -nw"
alias vi="nvim"
alias vim="nvim"

# User specific environment
[[ -d "$HOME/bin"          ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.bun/bin"     ]] && PATH="$HOME/.bun/bin:$PATH"
[[ -d "$HOME/.cargo/bin"   ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -d "$HOME/.deno/bin"    ]] && PATH="$HOME/.deno/bin:$PATH"
[[ -d "$HOME/.ghcup/bin"   ]] && PATH="$HOME/.ghcup/bin:$PATH"
[[ -d "$HOME/.local/bin"   ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.emacs.d/bin" ]] && PATH="$HOME/.emacs.d/bin:$PATH"

export PATH

