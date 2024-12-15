stty erase ^H

# path
export PATH



# User specific environment
[[ -d "/opt/homebrew/bin"            ]] && PATH="/opt/homebrew/bin:$PATH"
[[ -d "/opt/homebrew/sbin"           ]] && PATH="/opt/homebrew/sbin:$PATH"
[[ -d "/usr/local/bin"               ]] && PATH="/usr/local/bin:$PATH"
[[ -d "$HOME/bin"                    ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/go/bin"                 ]] && PATH="$HOME/go/bin:$PATH"
[[ -d "$HOME/.bun/bin"               ]] && PATH="$HOME/.bun/bin:$PATH"
[[ -d "$HOME/.cargo/bin"             ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -d "$HOME/.deno/bin"              ]] && PATH="$HOME/.deno/bin:$PATH"
[[ -d "$HOME/.ghcup/bin"             ]] && PATH="$HOME/.ghcup/bin:$PATH"
[[ -d "$HOME/.local/bin"             ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/share/elixir-ls" ]] && PATH="$HOME/.local/share/elixir-ls:$PATH"
[[ -d "$HOME/.local/share/erlang_ls" ]] && PATH="$HOME/.local/share/erlang_ls:$PATH"
[[ -d "$HOME/.local/share/zig"       ]] && PATH="$HOME/.local/share/zig:$PATH"
[[ -d "$HOME/.emacs.d/bin"           ]] && PATH="$HOME/.emacs.d/bin:$PATH"
export PATH



export EDITOR='hx'
export VISUAL='hx'
export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"



# Aliases
alias cat='bat -pp'
alias cd='z'
alias df='df -h'
alias emacs="emacsclient -nw -c -a 'emacs'"
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias lt='eza --tree'
alias ldk='lazydocker'
alias rm='rip'
alias sbcl='rlwrap sbcl'
alias tree='eza --tree'
alias vi="hx"
alias vim="hx"



# Sources
[[ -f "$HOME/.bun/_bun"                   ]] && . "$HOME/.bun/_bun"
[[ -f "$HOME/.cargo/env"                  ]] && . "$HOME/.cargo/env"
[[ -f "$HOME/.ghcup/env"                  ]] && . "$HOME/.ghcup/env"
[[ -f "$HOME/.opam/opam-init/init.sh"     ]] && . "$HOME/.opam/opam-init/init.sh"
[[ -f "$HOME/.venv/bin/activate"          ]] && . "$HOME/.venv/bin/activate"
[[ -f "$HOME/.asdf/asdf.sh"               ]] && . "$HOME/.asdf/asdf.sh"
[[ -f "$HOME/.asdf/completions/asdf.bash" ]] && . "$HOME/.asdf/completions/asdf.bash"



eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(opam env --switch=default)"
eval "$(fnm env --use-on-cd --shell zsh)"



# ############################################################
# Zellij
# ############################################################
if command -v zellij &> /dev/null &&
  [ -n "$PS1" ] &&
  [[ ! "$TERM" =~ screen ]] &&
  [[ ! "$TERM" =~ zellij ]] &&
  [ -z "$ZELLIJ" ]; then
  exec zellij
fi




# ############################################################
# Yasi
# ############################################################
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
