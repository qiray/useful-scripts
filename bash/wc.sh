#!/bin/bash

# Script for count words and lines in files with defined types
# $1 is a directory where files are located
# other args - extensions of files to process

if (( $# < 2 )); then
    echo "There must be at least 2 arguments - directory and file extensions to count"
    exit
fi

DIR=$1
shift
TYPES=( -name "*.$1")
shift
for ext in "$@"; do
    TYPES+=( -or -name \*."$ext" )
done
find "$DIR" -type f \( "${TYPES[@]}" \) -exec wc {} +
