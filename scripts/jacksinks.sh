#!/bin/bash
source ./info/functions

clear

############## OLD SCRIPTS
# pactl load-module module-jack-sink client_name=main_sink connect=no
# pactl load-module module-jack-source client_name=main_source connect=no
# pactl load-module module-jack-sink client_name=discord_sink connect=no
# pactl load-module module-jack-source client_name=discord_source connect=no
# pactl load-module module-jack-sink client_name=music_sink connect=no
# pactl load-module module-jack-source client_name=music_source connect=no
# pactl load-module module-jack-sink client_name=soundboard-sink connect=no
# pactl load-module module-jack-source client_name=soundboard-source connect=no
###############

pactl load-moudle module-remap-source source_name=discordSource
pactl load-module module-null-sink sink_name=discord
pactl load-module module-null-sink sink_name=spotify
pactl load-module module-null-sink sink_name=master

echo
echo "Successfully launched 4 JACK sinks / sources"
echo
return
