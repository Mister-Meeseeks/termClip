#!/bin/bash -eu

export libDir=$scriptDir
export etcDir=$scriptDir/../etc/

export putIntoBin=$libDir/putIntoBin.sh
export takeFromBin=$libDir/takeFromBin.sh
export retrieveBinDir=$libDir/retrieveBinDir.sh
export lookupHistItem=$libDir/lookupHistItem.sh
export measureHistSize=$libDir/measureHistSize.sh

export configBase=config.sh
export clipboardSubDir=clipboard/
export defaultSubDir=default/
export binsSubDir=bins/

export defaultConfigDir=$etcDir/$configBase

