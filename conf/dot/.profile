# #############################################################################
# `.profile` or `.bash_profile`
#
# This file starts when you log in to the system.
# For example, when logging in to a console or starting on SSH session.
#   - Initialize Shell
#   - Set environment variables
# #############################################################################

umask 022

export HISTSIZE=10000
export HISTFILESIZE=10000
export EDITOR='nvim'                # or `emacsclient -cw`


# User specific environment
[[ -d "$HOME/bin"          ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.bun/bin"     ]] && PATH="$HOME/.bun/bin:$PATH"
[[ -d "$HOME/.cargo/bin"   ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -d "$HOME/.deno/bin"    ]] && PATH="$HOME/.deno/bin:$PATH"
[[ -d "$HOME/.ghcup/bin"   ]] && PATH="$HOME/.ghcup/bin:$PATH"
[[ -d "$HOME/.local/bin"   ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.emacs.d/bin" ]] && PATH="$HOME/.emacs.d/bin:$PATH"
export PATH

# Call `.bashrc`
[[ -f $HOME/.bashrc                 ]] && . $HOME/.bashrc
