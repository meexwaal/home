# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/max/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# My additions from bash
alias msj="ssh msjohnso@unix.andrew.cmu.edu"
alias ccmsj="ssh msjohnso@unix.club.cc.cmu.edu"
alias edit="emacs -nw"

export PATH=$PATH:$HOME/bin
export CPPFLAGS="-Wall -Wextra -Wshadow -Werror -std=c++14 -pedantic -g"
export CFLAGS="-Wall -Wextra -Wshadow -Werror -std=c11 -pedantic -g"
alias gst="git status"

# My additions
export PS1="[%{%F{red}%B%}%n%{%f%b%}]: "
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^W' kill-region
bindkey '^[[3;5~' kill-word

alias ls='ls --color=auto --hide="*~"'
alias la="ls -a"
export WORDCHARS="*?[]~&;!#$%^(){}<>" # Chars that are treated as words
eval $(dircolors -b $HOME/.dircolors) # https://github.com/trapd00r/LS_COLORS

if [[ ! -o login ]] ; then
    export TERM=xterm-256color
else
    export TERM=xterm          # This makes control+arrows work better
fi

alias nixedit="sudo emacs -nw /etc/nixos/configuration.nix"
alias nixswitch="sudo nixos-rebuild switch"
alias nixtest="sudo nixos-rebuild test"
# check out
#https://github.com/zsh-users/zsh-syntax-highlighting

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/nix/var/nix/profiles/system/sw/lib

function mkcd(){mkdir $1; cd $1}
alias ..="cd .."
