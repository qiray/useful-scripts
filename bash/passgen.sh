#!/bin/bash


# https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string

#TODO: use different lengths, probabilities, rules (and maybe add words like xkcd)

< /dev/urandom tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' | head -c 13  ; echo
