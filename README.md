MBED Remounter
======
Another workaround for the problem that HDK-based mbeds cannot be handled properly by a Mac rnning Yosemite.
This is implemented as a launchd daemon that continuously watches the file system of your Mac.
If the daemon finds that an mbed is connected, it automatically fixes the mount mode of the device so that you can successfully write to the mbed.
Direct drag & drop copying to the mbed drive is also resumed.

Installation
------

    sudo cp org.takuo.mbedremounter.plist /Library/LaunchDaemons
    sudo launchctl load /Library/LaunchDaemons/org.takuo.mbedremounter.plist

