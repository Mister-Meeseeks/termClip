#!/bin/bash -eu

function initializeBinDir() {
    local binDir=$1
    mkdir -p $binDir
    mkdir -p $binDir/$historySubDir/
}

if [[ -z $binName ]] ; then
    binDir=$clipboardDefaultDir/
else
    binDir=$clipboardBinsDir/$binName/
fi

initializeBinDir $binDir
echo $binDir
