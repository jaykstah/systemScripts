#!/bin/bash
source ./info/functions

clear
echo
echo "Mapping tablet resolution to HDMI-0 and disabling finger touch..."
echo
xinput map-to-output 19 HDMI-0
xinput map-to-output 22 HDMI-0
xinput disable 21
echo Success!
echo
exit 0
