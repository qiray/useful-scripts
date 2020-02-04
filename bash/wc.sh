#!/bin/bash

# Script for count words and lines in files with defined types
# $1 is a directory where files are located
# other args - extensions of files to process

# TODO: make it work
DIR=$1
shift
TYPES=""
for ext in "$@"; do
    TYPES=$(echo $TYPES -name \"*."$ext"\" -or)
done
TYPES=${TYPES/%-or/} #remove last -or
SEARCH="\\( $TYPES \\)"
echo "$DIR" $SEARCH
# find $DIR -type f $SEARCH -exec wc {} +