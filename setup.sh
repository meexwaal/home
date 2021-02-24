#!/bin/bash

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

# If ~/.bashrc exists, is a regular file, and is non-empty
if [ -f ~/.bashrc -a -s ~/.bashrc ]
then
    >&2 echo "Move or modify existing .bashrc?"
    select c in "Modify" "Move" "Show" "Skip"; do
        case $c in
            Modify )
                # Prepend the modifications to the existing .bashrc
                if [ -e ~/.bashrc.tmp ]
                then
                    >&2 echo "File ~/.bashrc.tmp exists. Aborting."
                    exit 1
                fi
                cp $HOME_DIR/template/.bashrc ~/.bashrc.tmp
                cat ~/.bashrc >> ~/.bashrc.tmp
                mv ~/.bashrc.tmp ~/.bashrc
                break;;

            Move )
                # Move .bashrc to .bashrc.orig and source it in the new .bashrc
                if [ -e ~/.bashrc.orig ]
                then
                    >&2 echo "File ~/.bashrc.orig exists. Aborting."
                    exit 1
                fi
                mv -i ~/.bashrc ~/.bashrc.orig
                cp $HOME_DIR/template/.bashrc ~/.bashrc
                echo "source ~/.bashrc.orig" >> ~/.bashrc
                break;;

            Show )
                less ~/.bashrc
                # No break, so the select will loop and ask for another input
                ;;

            Skip )
                >&2 echo "Skipping .bashrc setup"
                break;;
        esac
    done
else
    >&2 echo "Populating .bashrc"
    cp $HOME_DIR/template/.bashrc ~/.bashrc
fi

mkdir -p $STATE_DIR
echo 1 > $STATE_DIR/setup

>&2 echo "Setup complete"
