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
alias cat='bat'
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
alias vi="hx"
alias vim="hx"



# Scripts
[[ -f "$HOME/.cargo/env"                         ]] && . "$HOME/.cargo/env"
[[ -f "$HOME/.ghcup/env"                         ]] && . "$HOME/.ghcup/env"
[[ -f "$HOME/.opam/opam-init/init.sh"            ]] && . "$HOME/.opam/opam-init/init.sh"
[[ -f "$HOME/.local/share/pdm/venv/bin/activate" ]] && . "$HOME/.local/share/pdm/venv/bin/activate"



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
# for Yasi
# ############################################################
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}



# ############################################################
# for Zoxide
# ############################################################
function __zoxide_pwd() {
    \builtin pwd -L
}

function __zoxide_cd() {
    \builtin cd -- "$@"
}

__zoxide_oldpwd="$(__zoxide_pwd)"

function __zoxide_hook() {
    \builtin local -r retval="$?"
    \builtin local pwd_tmp
    pwd_tmp="$(__zoxide_pwd)"
    if [[ ${__zoxide_oldpwd} != "${pwd_tmp}" ]]; then
        __zoxide_oldpwd="${pwd_tmp}"
        \command zoxide add -- "${__zoxide_oldpwd}"
    fi
    return "${retval}"
}

if [[ ${PROMPT_COMMAND:=} != *'__zoxide_hook'* ]]; then
    PROMPT_COMMAND="__zoxide_hook;${PROMPT_COMMAND#;}"
fi

__zoxide_z_prefix='z#'

function __zoxide_z() {
    if [[ $# -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ $# -eq 1 && $1 == '-' ]]; then
        __zoxide_cd "${OLDPWD}"
    elif [[ $# -eq 1 && -d $1 ]]; then
        __zoxide_cd "$1"
    elif [[ $# -eq 2 && $1 == '--' ]]; then
        __zoxide_cd "$2"
    elif [[ ${@: -1} == "${__zoxide_z_prefix}"?* ]]; then
        \builtin local result="${@: -1}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

\builtin unalias z &>/dev/null || \builtin true
function z() {
    __zoxide_z "$@"
}

\builtin unalias zi &>/dev/null || \builtin true
function zi() {
    __zoxide_zi "$@"
}

if [[ ${BASH_VERSINFO[0]:-0} -eq 4 && ${BASH_VERSINFO[1]:-0} -ge 4 || ${BASH_VERSINFO[0]:-0} -ge 5 ]] &&
    [[ :"${SHELLOPTS}": =~ :(vi|emacs): && ${TERM} != 'dumb' ]]; then
    \builtin bind '"\e[0n": redraw-current-line' &>/dev/null

    function __zoxide_z_complete() {
        [[ ${#COMP_WORDS[@]} -eq $((COMP_CWORD + 1)) ]] || return

        if [[ ${#COMP_WORDS[@]} -eq 2 ]]; then
            \builtin mapfile -t COMPREPLY < <(
                \builtin compgen -A directory -- "${COMP_WORDS[-1]}" || \builtin true
            )
        elif [[ -z ${COMP_WORDS[-1]} ]] && [[ ${COMP_WORDS[-2]} != "${__zoxide_z_prefix}"?* ]]; then
            \builtin local result
            result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- "${COMP_WORDS[@]:1:${#COMP_WORDS[@]}-2}")" &&
                COMPREPLY=("${__zoxide_z_prefix}${result}/")
            \builtin printf '\e[5n'
        fi
    }

    \builtin complete -F __zoxide_z_complete -o filenames -- z
    \builtin complete -r zi &>/dev/null || \builtin true
fi
