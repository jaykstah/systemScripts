#!/bin/bash
source ./info/functions

## Restart pipewire to start fresh on login
systemctl --user restart pipewire pipewire-pulse wireplumber

## Load virtual sinks for output
clear
pactl load-module module-remap-source source_name=discordSource
pactl load-module module-null-sink sink_name=discord
pactl load-module module-null-sink sink_name=spotify
pactl load-module module-null-sink sink_name=master
pactl load-module module-null-sink sink_name=soundboard

## Load "default" sink
pactl load-module module-null-sink object.linger=1 media.class=Audio/Duplex sink_name=default audio.position=FL,FR,RL,RR

## Load tcp tunnel to route Steam Deck or other device's audio 
pactl load-module module-native-protocol-tcp listen=192.168.1.16
echo
echo "Successfully launched 4 JACK sinks / sources"
echo

## Load carla (comment out if using session manager)
# carla-rack /home/jaykstah/Documents/configBackups/carlaPresets/voiceV15X50-2.carxp
return
	
