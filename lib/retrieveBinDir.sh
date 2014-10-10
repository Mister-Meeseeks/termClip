#!/bin/bash -eu

function initializeBinDir() {
    local binDir=$1
    mkdir -p $binDir
    mkdir -p $binDir/$historySubDir/
}

if [[ -z $binName ]] ; then
    binDir=$clipboardDir/$defaultBinSubDir/
else
    binDir=$clipboardDir/$binsSubDir/$binName/
fi

initializeBinDir $binDir
echo $binDir
