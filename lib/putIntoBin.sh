#!/bin/bash -eu

binDir=$1

histSize=$($measureHistSize $binDir)
if [[ $histSize -ge $MAX_CLIPBOARD_HIST_SIZE ]] ; then
    firstHistItem=$($lookupHistItem $binDir 1)
    rm $firstHistItem
fi

lastHistVersion=$($lookupHistItem -x $binDir -1)
nextHistVersion=$(( $lastHistVersion + 1 ))
nextHistItem=$($lookupHistItem -v $binDir $nextHistVersion)

cat > $nextHistItem
