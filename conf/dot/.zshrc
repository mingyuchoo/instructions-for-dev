# path
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/sbin:$PATH"
PATH="$HOME/.local/bin:$PATH"
export PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jonathan"
ZSH_THEME_RANDOM_CANDIDATES=( "xiong-chiamiov-plus" "jonathan" "gnzh" "af-magic" "agnoster" )

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=( aws cabal direnv dotenv git rust tmux )

export ARCHFLAGS="-arch x86_64"
export EDITOR='nvim'
export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"

# aliases
alias ls="ls -F"
alias ll="ls -la"
alias la="ls -a"

# env
export NVM_DIR="$HOME/.nvm"

# source
source "$HOME/.cargo/env"
source "$HOME/.ghcup/env"
source "$HOME/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null
source "$NVM_DIR/nvm.sh"
source "$NVM_DIR/bash_completion"
source "$ZSH/oh-my-zsh.sh"