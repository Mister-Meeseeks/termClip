#!/bin/bash -eu

binDir=$1

earliestVersion=$($lookupHistItem -x $binDir +1)
latestVersion=$($lookupHistItem -x $binDir -1)

if [[ ! -z $latestVersion ]] ; then
    numVersions=$(( $latestVersion - $earliestVersion + 1 ))
    echo $numVersions
else
    echo 0
fi

