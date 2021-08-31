#!/bin/bash

# Replace theme for root user
clear
echo "Replacing theme for root user! (Requires sudo permission) PRESS CTRL+C TO CANCEL"
echo "PRESS [ENTER] TO CONTINUE"
read -s
sudo sed -i "/Inherits/s/=.*/=$THEME/" /usr/share/icons/default/index.theme

# Replace theme for display manager
clear
echo "Replacing theme for SDDM! (Requires sudo permission) PRESS CTRL+C TO CANCEL"
echo "PRESS [ENTER] TO CONTINUE"
sudo sed -i "/CursorTheme/s/=.*/=$THEME/" /etc/sddm.conf.d/sddm.conf

# Restart display manager to prompt login again so that changes can be seen
read -n1 -p -s "Logout to use theme change? (Need sudo permission) [y/n]" doit
case $doit in
    y|Y) systemctl restart sddm ;;
    n|N) echo exiting && exit 0 ;;
    *) echo exiting && exit 0 ;;
esac
