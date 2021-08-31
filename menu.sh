#!/bin/bash
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
echo "1) JACK Sinks ( PulseAudio <---> JACK )"
echo "2) VirtualCam ( Use OBS as a camera via v4l2loopback )"
echo "3) Tabletfix ( Set resolution of drawing tablet )"
echo "4) Performance ( Set all CPU cores/threads to high performance mode)"
echo "5) Update GRUB Config"
echo "6) Change mouse cursor theme globally"
echo "7) --- COMING SOON ---"
echo "A) About this script"
echo "Q) Quit"
echo
read -p "Selection:" mainMenu

# Main menu for launching other scripts

case $mainMenu in
    "1") 
        "$jackSinks"
        ;;
    "2")
        "$virtualCam"
        ;;
    "3") 
        "$tabletFix"
        ;;
    "4") 
        sudo "$performance"
        ;;
    "5") 
        "$updateGrub"
        ;;
    "6") 
        "$cursorChange"
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
