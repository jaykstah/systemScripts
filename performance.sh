#!/bin/bash
clear
echo "Appending performance to /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "Success!"
echo
echo "Return to menu? (Y/N)"
echo
read -n1 -s -p "Selection:" input

case $input in
	"Y"|"y") ./menu.sh ;;
	*) exit 0 ;;
esac
