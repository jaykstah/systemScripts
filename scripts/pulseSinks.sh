#!/bin/bash
source ./info/functions

clear
pactl load-module module-remap-source source_name=discordSource
pactl load-module module-null-sink sink_name=discord
pactl load-module module-null-sink sink_name=spotify
pactl load-module module-null-sink sink_name=master
pactl load-module module-null-sink sink_name=soundboard
pactl load-module module-native-protocol-tcp listen=192.168.1.16
echo
echo "Successfully launched 4 JACK sinks / sources"
echo
return
