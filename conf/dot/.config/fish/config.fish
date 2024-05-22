umask 022

stty erase 

# ENV
set -gx EDITOR 'nvim'
set -gx LANG en_US.UTF-8
set -gx MANPATH "/usr/local/man:$MANPATH"
set -gx PAGER 'cat'

set -x HIST_STAMPS "yyyy-mm-dd"
set -x fish_history_size 20000

# PATH
fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path /home/linuxbrew/.linuxbrew/sbin
fish_add_path /usr/local/bin
fish_add_path $HOME/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.rd/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.fly/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/emacs/bin
fish_add_path $HOME/.opam/default/bin
fish_add_path $HOME/.nvm/versions/node/v22.1.0/bin
fish_add_path $HOME/.zig

# ALIASES
alias ls="ls --color=auto"
alias la="ls -la"
alias ll="ls -l"
alias lz="lazydocker"
alias ed="emacs --daemon"
alias ec="emacsclient -c"
alias xclip="xclip -selection clipboard"
alias xsel="xsel --clipboard --input"

# ENV Hook
direnv hook fish | source
zoxide init fish | source

# FUNCTIONS
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    set cwd (cat -- $tmp)
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd -- $cwd
    end
    rm -f -- $tmp
end

function nvm
   bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.asdf/asdf.fish
