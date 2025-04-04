#!/bin/bash

#$1 - app name

sudo -i  env DISPLAY="$DISPLAY" XAUTHORITY="${XAUTHORITY-$HOME/.Xauthority}" "$1"
