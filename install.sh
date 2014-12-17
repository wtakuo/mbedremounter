#!/bin/sh
label=org.takuo.mbedremounter
file=$label.plist
dest=/Library/LaunchDaemons

if [ $(launchctl list | grep -c $label) == 1 ]; then
    if [ -f $dest/$file ]; then
        launchctl unload $dest/$file
    else
        echo Plase unload $label manually
    fi
fi

cp $file $dest
chmod go-w $dest/$file
launchctl load -w $dest/$file

