# This is intended as an extension to the shell-agnostic my.sh

export PS1=" %{%F{red}%B%}%n%{%f%b%} | "  # " max | "
export RPROMPT="%F{green}%~%f"

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^W' kill-region
bindkey '^[[3;5~' kill-word

# fg binding - runs a widget that runs fg
fg_widget() fg
zle -N fg_widget
bindkey '^Z' fg_widget

# Make pretty colors
export TERM=xterm-256color
# if [[ ! -o login ]] ; then
#     export TERM=xterm-256color
# else
#     export TERM=xterm          # This makes control+arrows work better
# fi

# Make fg not clog up the history
setopt hist_ignore_space
# We also added a space in front of fg in .alias

# If we run out of space, remove duplicates first
setopt hist_expire_dups_first

# When searching history, skip duplicates. Unfortunately, doesn't apply
# to "up"ing through history, only searching.
setopt hist_find_no_dups

# For that, we have to modify what we save. Don't save a command if it
# is a duplicate of the previous one
setopt hist_ignore_dups

# List after changing directories
# https://stackoverflow.com/a/3964198
function list_dir() {
    emulate -L zsh
    ls
}
# chpwd_functions=(${chpwd_functions[@]} "list_dir")
