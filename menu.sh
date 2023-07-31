#!/bin/bash
cd "$(dirname "$0")"
source ./info/functions

main() {
clear
echo
echo
echo "> WELCOME TO JAYKSTAH'S SYSTEM SCRIPT HUB <"
echo
echo "____________________________________________"
echo "To get started, make a selection:"
echo "____________________________________________"
echo
echo "press ctl-c to exit at any time"
echo
echo "1) Pulse Sinks ( Virtual outputs/inputs to separate audio streams )"
echo "2) VirtualCam ( Use OBS as a camera via v4l2loopback )"
echo "3) Tabletfix ( Set resolution of drawing tablet [X11 Only])"
echo "4) Performance ( Set all CPU cores/threads to high performance mode)"
echo "5) Update GRUB Config"
echo "6) Change mouse cursor theme globally"
echo "7) Remove orphaned packages ( via pacman )"
echo "A) About this script"
echo "Q) Quit"
echo
read -p "Selection:" mainMenu

# Main menu for launching other scripts

case $mainMenu in
    "1") 
        source "$audioStartup"
        main
        ;;
    "2")
        source "$virtualCam"
        main
        ;;
    "3") 
        "$tabletFix"
        main
        ;;
    "4") 
        source "$performance"
        main
        ;;
    "5") 
        source "$updateGrub"
        main
        ;;
    "6") 
        source "$cursorChange"
        main
        ;;
    "7")
        source "$orphanRemoval"
        ;;
    "Q"|"q") 
        clear
        echo
        echo EXITING MENU...
        echo
        exit 0 
        ;;
    "A"|"a")
        clear
        echo
        cat "$about"
        echo
        echo Press any key to return to menu...
        echo
        read -n1 -s -p ":"
        main
        ;;
    *) main ;;
esac

}
main
