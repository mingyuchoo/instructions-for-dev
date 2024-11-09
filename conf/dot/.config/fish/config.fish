stty erase ^H


umask 022


# ENVs
set -gx EDITOR hx
set -gx VISUAL hx
set -gx LANG en_US.UTF-8
set -gx MANPATH "/usr/local/man:$MANPATH"
set -gx PAGER bat


set -x HIST_STAMPS yyyy-mm-dd
set -x fish_history_size 20000
#set -x JAVA_HOME /usr/libexec/java_home


# PATHs
#fish_add_path /opt/homebrew/bin
#fish_add_path /opt/homebrew/sbin
#fish_add_path /usr/local/bin
fish_add_path $HOME/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.config/emacs/bin
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.opam/bin
fish_add_path $HOME/.rd/bin


# ALIASes
alias emacs="emacsclient -nw -c -a 'emacs'"
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"
alias lt="eza --tree"
alias ldk="lazydocker"
alias mkdir="mkdir -p"
alias sbcl='rlwrap sbcl'
alias tree="eza --tree"
alias vi="hx"
alias vim="hx"


# FUNCTIONs
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    set cwd (cat -- $tmp)
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd -- $cwd
    end
    rm -f -- $tmp
end


# EVALs
eval "$(direnv   hook fish)"
eval "$(starship init fish)"
eval "$(zoxide   init fish)"
eval "$(opam env --switch=default)"
eval "$(fnm env --use-on-cd --shell fish)"
