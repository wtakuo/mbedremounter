#!/bin/sh
label=org.takuo.mbedremounter
file=$label.plist
dest=/Library/LaunchDaemons

if [ $(launchctl list | grep -c $label) == 1 ]; then
    if [ -f $dest/$file ]; then
        launchctl unload $dest/$file
        rm -f $dest/$file
        echo Successfully unloaded $label
    else
        echo Plase unload $label manually
    fi
fi

