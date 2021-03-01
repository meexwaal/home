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
    git fetch -q
    # Only update if there are remote changes.
    if ! git diff-index --quiet origin/master --
    then
        >&2 printf "Updating $HOME_DIR... "
        git pull --quiet --ff-only && \
            >&2 echo "done."
    fi
else
    >&2 echo "You have local changes to $HOME_DIR. Commit them you wanker."
fi

cd - > /dev/null
