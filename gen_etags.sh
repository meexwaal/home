#!/bin/bash

# For generating an emacs TAGS file in a C++ repo

subdirs=("src")

mv TAGS .TAGS.bak

for subdir in ${subdirs[@]}; do
    cd $subdir
    # C++ tags
    find . -regex ".*\.\(cc\|cpp\|h+\)" -print | \
        ctags -e -f .CPPTAGS --c++-kind=+p --fields=+iaS --extra=+q --language-force=C++ -L -
    # Other tags
    find . -regex ".*\.\(c\|yaml\)" -print | etags -f .TAGS -
    cd - > /dev/null

    etags --append --include $subdir/.CPPTAGS --include $subdir/.TAGS
done
