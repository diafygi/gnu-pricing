#!/bin/bash

#get this script's directory and command name
pushd `dirname $0` > /dev/null
THISDIR=`pwd`
popd > /dev/null

#remove the pricing directory from the path
#(that way, the only commands that can't be priced are dirname, echo, and sed)
PATH=`echo $PATH | sed "s@$THISDIR:@@"`

#set the variables needed for command and path shortcuts
THISCMD=`basename "$0"`
BASEDIR=`dirname "$THISDIR"`

#read the current usage for this command
mkdir -p "$HOME/.gnu-pricing/"
if [ ! -f "$HOME/.gnu-pricing/$THISCMD.usage" ]
then
    USECOUNT="0"
else
    USECOUNT=`cat "$HOME/.gnu-pricing/$THISCMD.usage"`
fi

#print pricing if requested
for var in "$@"
do
    if [ "$var" = "--pricing" ]
    then

        #get the overall usage
        OVERALLTABLE=`$THISDIR/gnu-pricing | column -t -s IFS=$'\n'`

        #print the pricing help text
        echo "\
=======================
Welcome to GNU Pricing!
=======================

Using many GNU tools now cost \$0.01 per use.

This command ($THISCMD) has been used $USECOUNT times so far.

$OVERALLTABLE

Please pay the total cost at https://donate.fsf.org/
"
        exit 0
    fi
done

#increment usage
NEWCOUNT=$(( $USECOUNT + 1 ))
echo "$NEWCOUNT" > "$HOME/.gnu-pricing/$THISCMD.usage"

#run the command as normal
$THISCMD "$@"

