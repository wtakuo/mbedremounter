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
launchctl disable system/$label

if [ -f $ddest/$dfile ]; then
    rm -f $ddest/$dfile
fi

if [ -d $sdest ]; then
    rm -rf $sdest
fi
