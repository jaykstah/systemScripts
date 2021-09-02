#!/bin/bash
echo
sudo sh -c 'pacman -Qtdq | pacman -Rns -'
echo
echo "Removed orphaned packages! Press [ENTER] to continue!"
read -n1
return
