#!/bin/bash -eu

scriptDir=$(dirname $(readlink -f $0))
. $scriptDir/source.sh
. $scriptDir/sourceCfg.sh

binDir=$($retrieveBinDir)

if [[ $clipOp == "copy" ]] ; then
    if [[ -z $clipString ]] ; then
	cat | $putIntoBin $binDir 
    else
	echo $clipString | $putIntoBin $binDir
    fi
else
    $takeFromBin $binDir
fi

