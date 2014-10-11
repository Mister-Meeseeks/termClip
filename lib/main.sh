#!/bin/bash -eu

scriptDir=$(dirname $(readlink -f $0))
. $scriptDir/source.sh
. $scriptDir/sourceCfg.sh

binDir=$($retrieveBinDir)

if [[ $clipOp == "copy" ]] ; then
    if [[ -z $clipDataString ]] ; then
	cat | $putIntoBin $binDir 
    else
	echo $copyString | $putIntoBin $binDir
    fi
else
    $takeFromBin $binDir
fi

