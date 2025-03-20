# ZMK Config for the Kinesis mWave

This repository contains the keymap files for the Kinesis mWave Mechanical Keyboard. There are 3 discrete keymap files, one for each variant: ANSI Windows, ANSI Mac, ISO Windows (not in production) so please choose the appropriate .keymap file. Power users who prefer not to customize their device with Kinesis Clique (https://clique.kinesis-ergo.com/) or ZMK Studio (https://zmk.studio/) can use a graphical keymap editor (example: https://nickcoutsos.github.io/keymap-editor/) or edit their keymap files directly on GitHub.

Kinesis does not officially support installing custom firmware on this device and no documentation, support or troubleshooting is offered. Proceed at your own risk. If you were to brick your keyboard with custom firmware that would invalidate your warranty.


## File Structure

[config/mwave_33.conf](config/mwave_33.conf): This file contains local Kconfig override flags

[config/mwave_33.keymap](config/mwave_33.keymap): This file contains the ANSI Windows keymap

[config/mwave_33_mac.keymap](config/mwave_33_mac.keymap): This file contains the ANSI Mac keymap

[config/mwave_33_iso.keymap](config/mwave_33_iso.keymap): This file contains the ISO keymap

All other files in the [config/](config/) folder should not be edited. They contain crucial configuration information for the functionality of the device.

