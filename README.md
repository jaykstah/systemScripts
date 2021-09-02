# systemScripts

## A collection of bash tools for personal automation / utility

### Intro. 

systemScripts is a collection of personal automation scripts I've written for my main machine. I've decided to host them on Github in case anyone finds use for any and decides do modify it for use on their own system.

A huge disclaimer I must pose right off the bat is that I am by no means an expert in writing bash scripts, nor a sage in the wisdom of the Linux kernel / systemd.
I do accept fair criticism of what I've posted here and hope to continually learn and improve. These scripts are just a fun hobby to try things out and I don't mind minor breakage of my personal system too much. If you are to run these scripts on your own system I recommend reading through them first to understand what they are doing, and take a look at `info/functions` in a text editor to check if the paths I import as variables make sense for you.

It should be noted that I've written these on an Arch Linux install using systemd for init and Xorg as the display server. Some scripts for configuration are explicitly written expecting these things and are by no means smart enough to make assumptions about your setup. They may break things if your system is set up different than mine.

With that out of the way, have fun exploring my scripts and I hope you either get a laugh out of them or find some use! 

### Overview.

#### menu.sh
This is a simple menu I've written for myself to launch first in order to run specific scripts I use on a near daily basis with ease. It is meant to offer a clean visual representation of all of the scripts that are usable, though the individual scripts should run fine on their own.

#### assets/
This directory is meant to simply host text files and other similar assets that some of the scripts might want to display. There currently isn't much in there as of now aside from some silly ASCII art I like to have automatically displayed at my TTY prompts. 

#### info/
This directory is meant to store files common to some of the scripts, mainly variables referencing directories across the system to be sourced into the main scripts. 
It also contains plaintext files that serve as dedicated notes about certain functions I use these scripts for. 

#### scripts/
This is where all of the individual tools live. Each tool is meant to largely serve a singular purpose and should be able to function when launched individually. 
They should also have the ability to properly return to `menu.sh` when launched from it. 

#### temp/
This is simply a place for scripts to temporarily store variables, mainly from user input. Some temp files will stay there and change when receiving a new input from a script while others will be removed after a script has completed its routine. 

### menu.sh
This is a simple menu to launch other scripts from. I decided it'd be fun to write a basic text menu to streamline getting to a few scripts I use regularly without needing to type out their  path manually when I open a terminal. It isn't necessary but may be a convenient way to check out all of the scripts in this collection.

### cursorChange.sh
This is a basic script relying on `sed` commands to edit configuration files. It requires a user to input the name of a cursor theme found in `/usr/share/icons` or `~/.icons` and will use that input to modify a few configuration files. It mainly is meant to modify settings for Xorg and GTK-3.0 theming along with an optional edit to SDDM and root's default icon theme for parity when at the login screen. 

### jacksinks.sh
This is a script that will launch a few PulseAudio <-> JACK sinks through the `jack-sink` PulseAudio module. By default it launches 4 sinks which I use to separate audio streams from a few apps to make mixing audio post-recording easier. This is mainly useful when recording videos through OBS as I can feed the individual sinks to their own audio tracks which is useful in video editing. 

### orphanRemoval.sh
This is just a simple way to run the common command to remove orphaned packages (dependencies which are no longer depended upon) on Arch Linux through the pacman package manager. 

### performance.sh
This is a simple way to change the cpu scaling governor to performance mode. It is written specficially for a 4-core system but I might expand it to first detect the number of cores a system has before editing, so it can be copied over to other systems. I usually use this to ensure performance mode is enabled before launching a heavy workload such as music production or rendering.

### tabletfix.sh
This is a simple way to map the resolution of my drawing tablet to my main monitor, which is usually connected to HDMI-0. This is done through xinput. It is not very smart and may require manual modification on other systems to get the xinput ID of a drawing table and the correct display output for primary monitor. This is mainly used on my system due to drawing tablets being mapped across all of my monitors by default when initially plugged in under i3wm. There is likely a more elegant way to make this change persistent but I decided one day to just write a script to run a few xinput commands.

### updatgrub.sh
This simply runs the command to update my GRUB configuration after changes and return to `menu.sh` after completion. Used occasionally when installing different kernels or discovering OS's on other drives.

### virtualcam.sh
This requires v4l2loopback. It creates a loopback device named 'OBS Cam' and is mainly used in order to have OBS act as a camera input. This makes creating scenes for use in video chat software easy along with being able to share my screen on video chat software that might not support that kind of thing natively. Also fun for using OBS to run fun effects over my camera :)
