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

eval $(dircolors -b $HOME_DIR/.dircolors)

mkcd () {
  if mkdir $1; then
    cd $1
  fi
}

# git checkout-interactive
gci () {
    select b in $(git for-each-ref --format='%(refname:short)' refs/heads/)
    do
        git checkout $b
        break
    done
}

pysource () {
    if [[ $# == 0 ]]
    then
        # With no argument, look for any sub-directory with "env" in its name.
        files=( *env*/bin/activate )
    elif [[ $# == 1 && "$1" != "-h" ]]
    then
        # With one argument, strip one trailing / (if present) and look for any
        # sub-directory which has the argument as a prefix.
        files=( ${1%/}*/bin/activate )
    else
        echo "Find and source a python virtual environment." >&2
        echo "Usage: $0 [directory prefix]" >&2
        return 2
    fi

    if [[ ${#files[@]} == 1 ]]
    then
        # Bash uses 0-indexing, while zsh uses 1-indexing.
        # Fortunately, singleton arrays evaluate to their only element in both.
        if [[ -f $files ]]
        then
            echo "source $files"
            source $files
        else
            echo "No envs found"
            return 1
        fi
    else
        echo "Multiple options:"
        echo ${files[@]}
        return 1
    fi
}

f () {
    if [[ $# == 2 ]]
    then
        find $1 -name "$2"
    elif [[ $# == 1 ]]
    then
        find . -name "$1"
    else
        echo "Wrapper for find" >&2
        echo "Usage: $0 [dir] pattern" >&2
    fi
}

g () {
    if [[ $# == 2 || $# == 1 ]]
    then
        grep -ir "$1" --exclude="*TAGS" $2
    else
        echo "Wrapper for grep -ir" >&2
        echo "Usage: $0 pattern [dir]" >&2
    fi
}


################################################################################
# Terminal-specific

case $TERM in
    dumb)
        # dumb terms do weird things with PS1
        export PS1="> "
        ;;
    eterm*)
        # Emacs-specific ls colors
        LS_COLORS='rs=0:di=01;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
        ;;
    xterm*)
        ;;
esac
