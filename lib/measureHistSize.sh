#!/bin/bash -eu

binDir=$1

earliestVersion=$($lookupHistItem -x +1 $binDir)
latestVersion=$($lookupHistItem -x -1 $binDir)

if [[ ! -z $latestVersion ]] ; then
    numVersions=$(( $latestVersion - $earliestVersion + 1 ))
    echo $numVersions
else
    echo 0
fi

