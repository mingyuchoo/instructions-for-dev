stty erase ^H

umask 022

# ENVs
set -gx EDITOR 'emacsclient -t'
set -gx VISUAL 'emacsclient -t'
set -gx LANG en_US.UTF-8
set -gx MANPATH "/usr/local/man:$MANPATH"
set -gx PAGER 'cat'

set -x HIST_STAMPS "yyyy-mm-dd"
set -x fish_history_size 20000

# PATHs
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /usr/local/bin
fish_add_path /Applications/Docker.app/Contents/Resources/bin
fish_add_path /Applications/Visual Studio Code.app/Contents/Resources/app/bin
fish_add_path $HOME/Applications/Alacritty.app/Contents/MacOS
fish_add_path $HOME/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.config/emacs/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.opam/bin
fish_add_path $HOME/.rd/bin


# ALIASes
alias emacs="emacsclient -nw -c -a 'emacs'"
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"
alias mkdir="mkdir -p"
alias vi="nvim"
alias vim="nvim"


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
eval "$(zoxide   init fish)"
eval "$(starship init fish)"
eval "$(opam env --switch=default)"
eval "$(fnm env --use-on-cd)"
