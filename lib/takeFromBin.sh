#!/bin/bash -eu

decrementHistory=0

while getopts d opt ; do
    case $opt in
	d) decrementHistory=1;;
    esac
done
shift $(( $OPTIND - 1 ));
binDir=$1

lastHistItem=$($lookupHistItem $binDir -1)
cat $lastHistItem

if [[ $decrementHistory -gt 0 ]] ; then
    histSize=$($measureHistSize $binDir)
    if [[ $histSize -gt 1 ]] ; then
	rm $lastHistItem
    fi
fi
