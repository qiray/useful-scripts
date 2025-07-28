#!/bin/bash

#$1 - app name

sudo -i  env DISPLAY="$DISPLAY" XAUTHORITY="${XAUTHORITY-$HOME/.Xauthority}" "$1"

# Another way:

# user1:

# VAR1=`xauth list $DISPLAY`
# VAR2=`echo $DISPLAY`

# user2:

# xauth add $VAR1
# export DISPLAY=$VAR2
