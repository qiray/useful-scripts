#!/bin/bash

# Use it for copying folder with large amount of files via ssh

if (( $# < 1 )); then
    echo "There must be 2 arguments - remote address and "
    exit
fi

ADDRESS=$1
BASENAME=$(basename "$2")
DIRNAME=$(dirname "$2")

ssh "$ADDRESS" "cd $DIRNAME; tar zcf - $BASENAME" | tar zxf -
