#!/bin/bash

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
        ./jacksinks.sh
        ;;
    "2")
        ./virtualcam.sh
        ;;
    "3") 
        ./tabletfix.sh
        ;;
    "4") 
        sudo ./performance.sh
        ;;
    "5") 
        ./updategrub.sh
        ;;
    "6") 
        ./cursorChange.sh
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
        cat ./info/about.info
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
