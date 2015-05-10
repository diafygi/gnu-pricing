#!/bin/bash

#get this script's directory and command name
pushd `dirname $0` > /dev/null
THISDIR=`pwd`
popd > /dev/null
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
ARGS="$@"
for var in "$@"
do
    if [ "$var" = "--pricing" ]
    then

        #calculate the cost owed
        USECOST=$(( $USECOUNT * 15 / 10 ))
        if [ "${#USECOST}" = "1" ]
        then
            USECOST="0$USECOST"
        fi

        #print the pricing help text
        echo "\
Welcome to GNU Pricing for $THISCMD!

This command now costs \$0.015 per use.
You've used this command $USECOUNT so far.
Please pay \$${USECOST::-2}.${USECOST:${#num}-2} at https://donate.fsf.org/
"
        exit 0
    fi
done

#remove the pricing directory from the path
PATH=`echo $PATH | sed "s@$THISDIR:@@"`

#increment usage
NEWCOUNT=$(( $USECOUNT + 1 ))
echo "$NEWCOUNT" > "$HOME/.gnu-pricing/$THISCMD.usage"

#run the command as normal
$THISCMD $ARGS

