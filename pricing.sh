#!/bin/bash

#get this script's directory and command name
pushd `dirname $0` > /dev/null
THISDIR=`pwd`
popd > /dev/null
THISCMD=`basename "$0"`
BASEDIR=`dirname "$THISDIR"`

#print pricing if requested
ARGS="$@"
for var in "$@"
do
    if [ "$var" = "--pricing" ]
    then
        cat "$BASEDIR/doc/$THISCMD.pricing"
        exit 0
    fi
done

#remove the pricing directory from the path
PATH=`echo $PATH | sed "s@$THISDIR:@@"`

#run the command as normal
$THISCMD $ARGS
