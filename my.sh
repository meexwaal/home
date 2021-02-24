################################################################################
# Run hook to update home regularly

HOME_DIR=~/home
if [ ! -d $HOME_DIR ]
then
    >&2 echo "$HOME_DIR does not exist"
    return 1
fi

TIME_FILE=$HOME_DIR/.state/hook-time
CUR_TIME=$(date +'%s')
UPDATE_PERIOD=$((24 * 60 * 60))
if [ ! -f $TIME_FILE ] || \
   [ $CUR_TIME -ge $(($(cat $TIME_FILE) + $UPDATE_PERIOD)) ]
then
    source $HOME_DIR/hook.sh && \
        echo $CUR_TIME > $TIME_FILE
fi

################################################################################
# Aliases

source $HOME_DIR/.alias

################################################################################
# Set variables

export EDITOR="nano"

export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$HOME_DIR/bin

# CPPFLAGS=("-Wall" "-Wextra" "-Wshadow" "-Werror" "-std=c++14" "-pedantic" "-g")
# CFLAGS=("-Wall" "-Wextra" "-Wshadow" "-Werror" "-std=c11" "-pedantic" "-g")

export WORDCHARS="*?[]~&;!#$%^(){}<>" # Chars that are treated as words

################################################################################
# Miscellany

eval $(dircolors -b $HOME_DIR/.dircolors) # https://github.com/trapd00r/LS_COLORS

function mkcd(){
  if mkdir $1; then
    cd $1
  fi
}

################################################################################
# Shell-specific

if [ $TERM = "dumb" ]
then
    # dumb terms do weird things with PS1
    export PS1="> "
else
    # Make pretty colors
    export TERM=xterm-256color
fi
