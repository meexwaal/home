#!/bin/bash

# TODO:
# Should check for common annoyances in default bashrc (l, la, dircolors, maybe
# hist size) and let you comment them

HOME_DIR=~/home
if [ ! -d $HOME_DIR ]
then
    >&2 echo "$HOME_DIR does not exist"
    exit 1
fi

# Check whether we've already completed setup
STATE_DIR=$HOME_DIR/.state
if [ -e $STATE_DIR/setup ]
then
    >&2 echo "Setup has already run. Run again?"
    select yn in "No" "Yes"; do
    case $yn in
        No )
            >&2 echo "Aborting"
            exit 1;;
        Yes ) break;;
    esac
    done
fi

function setup_file {
    local FILE=$1
    local LOAD_SYNTAX="$2"

    # If ~/$FILE exists, is a regular file, and is non-empty
    if [ -f ~/$FILE -a -s ~/$FILE ]
    then
        >&2 echo "Move or modify existing $FILE?"
        select c in "Modify" "Move" "Show" "Skip"; do
            case $c in
                Modify )
                    # Modify the existing file to include this repo's template version.

                    # # Prepend the modifications to the existing ~/$FILE
                    # local TMP_FILE=~/$FILE.tmp
                    # if [ -e $TMP_FILE ]
                    # then
                    #     >&2 echo "File $TMP_FILE exists. Aborting."
                    #     exit 1
                    # fi
                    # cp $HOME_DIR/template/$FILE $TMP_FILE
                    # cat ~/$FILE >> $TMP_FILE
                    # mv $TMP_FILE ~/$FILE
                    # break;;

                    # Append the modifications to the existing ~/$FILE
                    cat $HOME_DIR/template/$FILE >> ~/$FILE
                    break;;

                Move )
                    # Move $FILE to $FILE.orig and load it in the new $FILE
                    local ORIG_FILE=~/$FILE.orig
                    if [ -e $ORIG_FILE ]
                    then
                        >&2 echo "File $ORIG_FILE exists. Aborting."
                        exit 1
                    fi
                    mv -i ~/$FILE $ORIG_FILE
                    cp $HOME_DIR/template/$FILE ~/$FILE
                    echo "$LOAD_SYNTAX" >> ~/$FILE
                    break;;

                Show )
                    less ~/$FILE
                    # No break, so the select will loop and ask for another input
                    ;;

                Skip )
                    >&2 echo "Skipping $FILE setup"
                    break;;
            esac
        done
    else
        >&2 echo "Populating ~/$FILE"
        cp $HOME_DIR/template/$FILE ~/$FILE
    fi
}

function setup_link {
    local SOURCE=$1 # Without $HOME_DIR prefix
    local DEST=$2   # Full path+filename, can start with ~/

    # If ~/$DEST exists, is a regular file, and is non-empty
    if [ -f $DEST -a -s $DEST ]
    then
        >&2 echo "Replace existing $DEST?"
        select c in "Replace" "Show" "Skip"; do
            case $c in
                Replace )
                    mv -i $DEST $DEST.orig
                    ln -s $HOME_DIR/$SOURCE $DEST
                    break;;

                Show )
                    less $DEST
                    # No break, so the select will loop and ask for another input
                    ;;

                Skip )
                    >&2 echo "Skipping $SOURCE setup"
                    break;;
            esac
        done
    else
        >&2 echo "Linking $SOURCE to $DEST"
        ln -s $HOME_DIR/$SOURCE $DEST
    fi
}

setup_file .bashrc "source ~/.bashrc.orig"
setup_file .emacs "(load-file \"~/.emacs.orig\")"

mkdir -p ~/.ipython/profile_default/startup/
setup_link ipython.py ~/.ipython/profile_default/startup/ipython.py

mkdir -p $STATE_DIR
echo 1 > $STATE_DIR/setup

>&2 echo "Setup complete"
