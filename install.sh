#!/bin/sh
# MBED Remounter
# Copyright (C) 2014, Takuo Watanabe
# http://developer.mbed.org/users/takuo/notebook/another-workaround-for-yosemite/
# This software is still in testing phase. Use it at your own risk.
#
# This software is distributed under Apache-2.0 license
# http://opensource.org/licenses/Apache-2.0

name=mbedremounter
domain=org.takuo
label=$domain.$name

dfile=$label.plist
ddest=/Library/LaunchDaemons
sfile=$name.py
sdest=/usr/local/share/$name

if [ $(launchctl list | grep -c $label) == 1 ]; then
    launchctl remove $label
fi

if [ ! -d $sdest ]; then
    mkdir -p $sdest
fi

cp $sfile $sdest
cp $dfile $ddest
chmod go-w $ddest/$dfile

launchctl enable system/$label
launchctl bootstrap system $ddest/$dfile
launchctl kickstart system/$label
