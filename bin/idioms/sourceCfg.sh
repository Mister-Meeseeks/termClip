#!/bin/bash -eu

termClip=$scriptDir/../termClip
termFlags=""

while getopts b: opt ; do
    case $opt in
	b) termFlags="$termFlags -b $OPTARG";;
    esac
done
shift $(( $OPTIND - 1 ))
termArgs="$*"

