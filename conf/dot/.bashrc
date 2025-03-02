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

export EDITOR='hx'
export VISUAL='hx'



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
alias sbcl='rlwrap sbcl'
alias tree='eza --tree'
alias vi="hx"
alias vim="hx"



# Scripts
[[ -f "$HOME/.cargo/env"                  ]] && . "$HOME/.cargo/env"
[[ -f "$HOME/.ghcup/env"                  ]] && . "$HOME/.ghcup/env"
[[ -f "$HOME/.opam/opam-init/init.sh"     ]] && . "$HOME/.opam/opam-init/init.sh"
[[ -f "$HOME/.venv/bin/activate"          ]] && . "$HOME/.venv/bin/activate"
[[ -f "$HOME/.asdf/asdf.sh"               ]] && . "$HOME/.asdf/asdf.sh"
[[ -f "$HOME/.asdf/completions/asdf.bash" ]] && . "$HOME/.asdf/completions/asdf.bash"


eval "$(direnv hook bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(opam env --switch=default)"
eval "$(fnm env --use-on-cd --shell bash)"



# ############################################################
# for Zellij
# ############################################################
if command -v zellij &> /dev/null &&
  [ -n "$PS1" ] &&
  [[ ! "$TERM" =~ screen ]] &&
  [[ ! "$TERM" =~ zellij ]] &&
  [ -z "$ZELLIJ" ]; then
  exec zellij
fi



# ############################################################
# for Yazi
# ############################################################
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
