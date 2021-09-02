#!/bin/bash
source ./info/functions

clear
echo
echo "Enabling v4l2loopback device named OBS Cam" 
echo "This requires sudo permission to use modprobe"
echo
sudo sh -c 'modprobe v4l2loopback devices=1 video_nr=10 card_label="OBS Cam" exclusive_caps=1'
echo
echo "Success!"
echo
echo "Press [ENTER] to return to menu!"
read -n1
return
