#!/bin/bash
# MBED Remounter
# Copyright (C) 2014, Takuo Watanabe
# http://developer.mbed.org/users/takuo/notebook/another-workaround-for-yosemite/
# This software is still in testing phase. Use it at your own risk.
#
# This software is distributed under Apache-2.0 license
# http://opensource.org/licenses/Apache-2.0

# The basic idea of the regular expression is by Ned Konz
# http://developer.mbed.org/users/takuo/notebook/another-workaround-for-yosemite/?compage=1#c14828

mount |
while read l; do
    if [[ $l =~ (/dev/[^\ ]+)\ on\ (/Volumes/(MBED|NUCLEO).*)\ \(msdos.*read-only.*\) ]]; then
        d=${BASH_REMATCH[1]}
        m=${BASH_REMATCH[2]}
        umount $d
        mkdir -p "$m"
        mount -w -o sync -t msdos $d "$m"
        # Uncomment the next line if you want to hear the notification voice
        # say Your embed is ready
    fi
done

