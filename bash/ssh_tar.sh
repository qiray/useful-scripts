#!/bin/bash

# Use it for copying folder with large amount of files via ssh to current folder. It's faster than pure ssh.
# $1 - address of remote machine
# $2 - path to directory to copy from remote machine

if (( $# < 1 )); then
    echo "There must be at least 2 arguments - remote address and directory"
    exit
fi

LAST_ARG="${@: -1}"
BASENAME=$(basename "$LAST_ARG")
DIRNAME=$(dirname "$LAST_ARG")
set -- "${@:1:$(($#-1))}"

ssh $* "cd $DIRNAME; tar zcf - $BASENAME" | tar zxf -
