#!/bin/sh
for m in /Volumes/MBED* /Volumes/NUCLEO*; do
    if [ -d "$m" -a $(diskutil info "$m" | egrep -c 'Read-Only Volume.*Yes') == 1 ]; then
        d=$(df -l | egrep "$m"\$ | awk '{print $1}')
        echo $d "$m"
        umount $d
        mkdir -p "$m"
        mount -w -o sync -t msdos $d "$m"
    fi
done

