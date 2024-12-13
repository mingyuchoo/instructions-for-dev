umask 022

stty erase 

# ENV
set -gx EDITOR hx
set -gx LANG en_US.UTF-8
set -gx MANPATH "/usr/local/man:$MANPATH"
set -gx PAGER cat

set -x HIST_STAMPS yyyy-mm-dd
set -x fish_history_size 20000

set -gx ASDF_DIR $HOME/.asdf

# PATH
fish_add_path /usr/local/bin
fish_add_path $HOME/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.asdf/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/emacs/bin
fish_add_path $HOME/.opam/default/bin
fish_add_path $HOME/.rd/bin
fish_add_path $HOME/.zig

# ALIASES
alias cat="bat -pp"
alias df="df -h"
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"
alias lt="eza --tree"
alias ldk="lazydocker"
alias tree="eza --tree"
alias vi="hx"
alias vim="hx"

# SCRIPTs
source $ASDF_DIR/asdf.fish

# ENV Hook
starship init fish | source
direnv hook fish | source
zoxide init fish | source
opam env --switch=default | source
fnm env --use-on-cd --shell fish | source

# FUNCTIONS
if type -q zellij &&
        not set -q PS1 &&
        not echo $TERM | grep -q screen &&
        not echo $TERM | grep -q zellij &&
        not set -q ZELLIJ
    exec zellij
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    set cwd (cat -- $tmp)
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd -- $cwd
    end
    rm -f -- $tmp
end
