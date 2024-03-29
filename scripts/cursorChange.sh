#!/bin/bash
source=./info/functions

echo Enter cursor theme name:
read THEME

echo "$THEME" > "$themeName"

# Replace theme in .Xresources
sed -i "/Xcursor.theme/s/: .*/: $THEME/" ~/.Xresources

# Replace theme in ~/.icons/default/index.theme
sed -i "/Inherits/s/=.*/=$THEME/" ~/.icons/default/index.theme

# Replace theme in ~/.config/gtk-3.0/settings.ini
sed -i "/gtk-cursor-theme-name/s/=.*/=$THEME/" ~/.config/gtk-3.0/settings.ini

# gsettings command
# exec gsettings set org.gnome.desktop.interface cursor-theme $THEME

# Confirm changes and exit
clear
echo
echo
echo "Changes committed for user's cursor theme"
echo "Config files changed:"
echo "~/.Xresources"
echo "~/.icons/default/index.theme"
echo "~/.config/gtk-3.0/settings.ini"
echo
echo
echo "Choose Option:"
echo "1) Continue to root & display manager theme change"
echo "2) Exit to menu"
read -n1 -s -p "Selection:" menu

case $menu in 
    "1") 
        # Replace theme for root user
        echo "Replacing theme for root user! (Requires sudo permission) PRESS CTRL+C TO CANCEL"
        echo "PRESS [ENTER] TO CONTINUE"
        read -n1 -s
        sudo sed -i "/Inherits/s/=.*/=$THEME/" /usr/share/icons/default/index.theme

        # Replace theme for display manager
        echo "Replacing theme for SDDM! (Requires sudo permission) PRESS CTRL+C TO CANCEL"
        echo "PRESS [ENTER] TO CONTINUE"
        read -n1 -s
        sudo sed -i "/CursorTheme/s/=.*/=$THEME/" /etc/sddm.conf.d/sddm.conf
        
        clear 
        echo
        echo
        echo "Changes committed for cursor theme"
        echo "Config files changed:"
        echo "/usr/share/icons/default/index.theme"
        echo "/etc/sddm.conf.d/sddm.conf"
        echo 
        ;;
    *)
        rm "$themeName"
        return
        ;;
esac

echo
echo
echo "Choose Option:"
echo "1) Log out and back in to see changes (May require password)"
echo "2) Exit"
read -n1 -s -p "Selection:" menu2

case $menu2 in
    "1")
        clear
        echo
        echo "YOU WILL BE LOGGED OUT IMMEDIATELY AND MUST LOG BACK IN. CONTINUE? (Y/N)"
        echo
        read -n1 -s restartDisplay
        case $restartDisplay in
            y|Y) loginctl terminate-session $session ;;
            n|N) exit 0 ;;
            *) exit 0;;
        esac
        exit 0
        ;;
    *)
        rm "$themeName"
        return
        ;;
esac

return
