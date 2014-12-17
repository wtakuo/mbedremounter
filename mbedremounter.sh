#!/bin/sh
# mbedremounter
# Copyright (C) 2014, Takuo Watanabe
# http://developer.mbed.org/users/takuo/notebook/another-workaround-for-yosemite/
# This program is still in testing phase. Use it at your own risk.
#
# This software is distributed under Apache-2.0 license
# http://opensource.org/licenses/Apache-2.0

for m in /Volumes/MBED* /Volumes/NUCLEO*; do
    if [ -d "$m" -a $(diskutil info "$m" | egrep -c 'Read-Only Volume.*Yes') == 1 ]; then
        d=$(df -l | egrep "$m"\$ | awk '{print $1}')
        echo $d "$m"
        umount $d
        mkdir -p "$m"
        mount -w -o sync -t msdos $d "$m"
    fi
done

