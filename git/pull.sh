#!/bin/bash

# Script for updating all repositories from text file $1
# $1 is a file containing list of repositories (for example see list_example.txt)
# etc

if (( $# < 1 )); then
    echo "There must be 1 argument - file with repositories' list"
    exit
fi

LISTFILE="$1"

while read -r line || [ -n "$line" ]; do
    [[ -z "$line" ]] && continue # ignore empty lines
    pushd "$PWD" > /dev/null|| exit 
    cd "${line/#~/$HOME}" || { popd && continue; }
    echo "Updating repository $line"
    git pull
    popd > /dev/null || exit
done < "$LISTFILE"
