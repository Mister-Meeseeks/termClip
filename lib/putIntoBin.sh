#!/bin/bash -eu

binDir=$1

activeDataPath=$binDir/$activeBase
historyDir=$binDir/$historySubDir/

histSize=$($getHistorySize $binDir)
if [[ $histSize -ge $MAX_CLIPBOARD_HISTORY_SIZE ]] ; then
    firstHistItem=$($lookupHistItem 1 $binDir)
    rm $firstHistItem
fi

lastHistVersion=$($lookupHistItem -x -1 $binDir)
nextHistVersion=$(( $lastHistVersion + 1 ))
nextHistItem=$($lookupHistItem -v $nextHistVersion $binDir)

cat > $nextHistItem
