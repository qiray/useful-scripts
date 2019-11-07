#!/bin/bash

# Script for calling function $2 for each directory from text file $1 and 
# $1 is a file containing list of repositories (for example see list_example.txt)
# $2 - command or function name to call for each directory
# $3 - text to show for each directory

if (( $# < 3 )); then
    echo "There must be 3 arguments - file list, function or command to do and text"
    exit
fi

LISTFILE="$1"
CMD="$2"
TEXT="$3"

while read -r line || [ -n "$line" ]; do
    [[ -z "$line" ]] && continue # ignore empty lines
    pushd "$PWD" > /dev/null|| exit 
    cd "${line/#~/$HOME}" || { popd && continue; }
    echo "$TEXT $line"
    $CMD
    popd > /dev/null || exit
done < "$LISTFILE"
