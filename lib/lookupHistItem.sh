#!/bin/bash -eu

extractVersionNum=0
indexVersion=0

while getopts xv opt ; do
    case $opt in
	x) extractVersionNum=1;;
	v) indexVersion=1;;
    esac
done
shift $(( $OPTIND - 1))
binDir=$1
histIdx=$2

historyDir=$binDir/$historySubDir/

function getHistItem() {
    if [[ $indexVersion -gt 0 ]] ; then
	getHistVersion $histIdx
    else
	getHistIndex $histIdx
    fi
}

function getHistVersion() {
    local versionNum=$1
    echo $historyDir/v.$versionNum.cpb
}

function getHistIndex() {
    local histIdx=$1
    if [[ $histIdx -lt 0 ]] ; then
	ls -v $historyDir/* | tail -n $histIdx | head -n 1
    else
	ls -v $historyDir/* | head -n $histIdx | tail -n 1
    fi
}

function pullItemData() {
    if [[ $extractVersionNum -gt 0 ]] ; then
	sed "s+.*v[.]\([0-9]*\).cpb+\1+"
    else
	cat
    fi
}

getHistItem | pullItemData
