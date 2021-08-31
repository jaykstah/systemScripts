#!/bin/bash
source ./info/functions

clear
echo
echo "Executing grub-mkconfig"
echo "This requires sudo permission!"
echo
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo
echo Success!
echo
exit 0
