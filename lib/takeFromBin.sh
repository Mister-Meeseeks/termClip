#!/bin/bash -eu

binDir=$1

lastHistItem=$($lookupHistItem $binDir -1)
cat $lastHistItem

if [[ $popHistory -gt 0 ]] ; then
    histSize=$($measureHistSize $binDir)
    if [[ $histSize -gt 1 ]] ; then
	rm $lastHistItem
    fi
fi
