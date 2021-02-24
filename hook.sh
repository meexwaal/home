#!/bin/bash

# If term isn't dumb and we're not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ $TERM = "dumb" ]
then
    return
fi

HOME_DIR=~/home
cd $HOME_DIR

# If the local checkout is unmodified, pull. Otherwise, issue a warning.
if git diff-index --quiet HEAD --
then
    git pull
else
    >&2 echo "You have local changes to $HOME_DIR. Commit them you wanker."
fi
