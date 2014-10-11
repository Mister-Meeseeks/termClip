#!/bin/bash -eu

export clipString=""
export clipOp="copy"
export binName=""
export popHistory=0
export termClipDir=~/.termClip/

while getopts s:pb:dh: opt ; do
    case $opt in
	s) clipString="$OPTARG";;
	p) clipOp="paste";;
	b) binName="$OPTARG";;
	d) popHistory=1;;
	h) termClipDir="$OPTARG";;
    esac
done

export userConfig=$termClipDir/$configBase
export clipboardDir=$termClipDir/$clipboardSubDir/
export clipboardDefaultDir=$clipboardDir/$defaultSubDir/
export clipboardBinsDir=$clipboardDir/$binsSubDir/

mkdir -p $termClipDir $clipboardDir $clipboardDefaultDir $clipboardBinsDir
if [[ ! -e $userConfig ]] ; then
    cp $defaultConfig $userConfig
fi

. $userConfig
