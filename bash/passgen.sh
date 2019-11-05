#!/bin/bash

# https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string

#TODO: at least one digit, special char, capital etc.
#TODO: maybe add words like xkcd

passgen() {
    head /dev/urandom | tr -dc "$1" | fold -w ${2:-16} | head -n 1
}

FILTER='a-z'
CAPITALS='A-Z'
DIGITS='0-9'
SPECIALCHARS='!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~'
STRONGRULES=true

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -l|--length)
            LENGTH="$2"
            shift
            shift
        ;;
        -c|--capital)
            FILTER={$FILTER}${CAPITALS}
            STRONGRULES=false
            shift
        ;;
        -d|--digit)
            FILTER={$FILTER}${DIGITS}
            STRONGRULES=false
            shift
        ;;
        -s|--specialchars)
            FILTER={$FILTER}${SPECIALCHARS}
            STRONGRULES=false
            shift
        ;;
        *) # unknown option
            shift
        ;;
    esac
done

if $STRONGRULES; then
    FILTER=${FILTER}${DIGITS}${SPECIALCHARS}
fi

passgen "$FILTER" ${LENGTH}