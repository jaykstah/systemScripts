#!/bin/bash
source ./info/functions

echo
echo "Return to menu? (Y/N)"
echo
read -n1 -s -p "Selection:" input

case $input in
	"Y"|"y") "$menu" ;;
	*) exit 0 ;;
esac
