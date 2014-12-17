MBED Remounter
======
Another workaround for the problem that HDK-based mbeds cannot be handled properly by a Mac rnning Yosemite.
This is implemented as a launchd daemon that continuously watches the file system of your Mac.
If the daemon finds that an mbed is connected, it automatically fixes the mount mode of the device so that you can successfully write to the mbed.
Direct drag & drop copying to the mbed drive is also resumed.

This software is still in testing phase. Use it at your own risk.
This software is distributed under Apache-2.0 license
http://opensource.org/licenses/Apache-2.0


Installation
------

    sudo sh install.sh

Uninstallation
------

    sudo sh uninstall.sh

Tested Platforms
------

* NXP mbed LPC1768
* NXP LPC00-MAX
* Freescale FRDM-KL25
* Freescale FRDM-KL46
* Freescale FRDM-K46F
* ST Nucleo F401RE
* Nordic nRF51822
* Switch Science mbed HRM1017





