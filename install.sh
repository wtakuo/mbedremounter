#!/bin/sh
name=mbedremounter
domain=org.takuo
label=$domain.$name

dfile=$label.plist
ddest=/Library/LaunchDaemons
sfile=$name.sh
sdest=/usr/local/share/$name

if [ $(launchctl list | grep -c $label) == 1 ]; then
    if [ -f $ddest/$dfile ]; then
        launchctl unload $ddest/$dfile
    else
        echo Plase stop and unload $label manually
        exit 1
    fi
fi

if [ ! -d $sdest ]; then
    mkdir -p $sdest
fi
cp $sfile $sdest
cp $dfile $ddest
chmod go-w $ddest/$dfile
launchctl load -w $ddest/$dfile

