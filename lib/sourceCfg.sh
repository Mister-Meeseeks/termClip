#!/bin/bash -eu

export copyString=""
export clipOp="copy"
export binName=""
export termClipDir="~/.termClip/"

while getopts s:pb:h: ; do
    case $opt in
	s) copyString="$OPTARG";;
	p) clipOp="paste";;
	b) binName="$OPTARG";;
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
