#!/bin/bash

# Use xcb platform and autostart OBS Replay Buffer. Replay buffer need to be configured within OBS settings. 
export QT_QPA_PLATFORM=xcb
obs --startreplaybuffer
