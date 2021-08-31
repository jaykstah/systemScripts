#!/bin/bash

# ENABLING MULTIVERSE REPOSITORY 
sudo add-apt-repository multiverse -y

# UPDATING & INSTALLING STANDARD SOFTWARE
sudo apt update && sudo apt upgrade -y 
sudo apt install obs-studio nextcloud-desktop vlc keepassxc

# SETTING UP KXSTUDIO REPO 
sudo apt-get install apt-transport-https gpgv -y
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
sudo dpkg -i kxstudio-repos_10.0.3_all.deb -Y
sudo apt update
sudo apt install cadence

# INSTALLING AUDIO SOFTWARE 
sudo apt install a2jmidid aeolus aj-snapshot aliki amb-plugins ambdec ams amsynth aubio-tools blop calf-plugins calf-ladspa dgedit drumgizmo drumkv1 ebumeter ecasound eq10q faust fil-plugins fluidsynth fomp giada gigedit guitarix-lv2 gxtuner guitarix-common guitarix hexter hydrogen infamous-plugins jaaa jack-stdio jackmeter helm jacktrip jalv jconvolver jnoisemeter lmms lv2file mcp-plugins mda-lv2 meterbridge mixxx musescore padthv1 pavucontrol puredata pd-lua qastools-common qasmixer qasconfig qashctl qmidiarp qmidinet qmidiroute qsampler qsynth qtractor qxgedit rev-plugins rosegarden samplv1 sc3-plugins setbfree snd solfege sonic-pi sonic-visualiser supercollider sweep swh-plugins synthv1 tap-plugins tal-plugins timidity vco-plugins vmpk vmpk wah-plugins x42-plugins yoshimi zam-plugins zita-ajbridge zita-at1 zita-bls1 zita-lrx zita-mu1 zita-njbridge zita-rev1 zynaddsubfx -y

# MANUALLY INSTALLING PLUGINS 

# DRAGONFLY ROOM REVERB 
wget "https://github.com/michaelwillis/dragonfly-reverb/releases/download/3.2.1/DragonflyReverb-Linux-64bit-v3.2.1.tgz"
tar -xf DragonflyReverb-Linux-64bit-v3.2.1.tgz
sudo mv -r DragonflyReverb-Linux-64bit-v3.2.1/*.lv2 /lib/lv2/
sudo mv DragonflyReverb-Linux-64bit-v3.2.1/*.so /lib/vst/
sudo rm -r DragonflyReverb-Linux-64bit-v3.2.1

# MANUALLY INSTALLING ARDOUR 
chmod +x Ardour-6.2.0-x86_64-gcc5.run
./Ardour-6.2.0-x86_64-gcc5.run
