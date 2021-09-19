#!/bin/bash
source ./info/functions

clear
pactl load-module module-remap-source source_name=discordSource
pactl load-module module-null-sink sink_name=discord
pactl load-module module-null-sink sink_name=spotify
pactl load-module module-null-sink sink_name=master
echo
echo "Successfully launched 4 JACK sinks / sources"
echo
return
