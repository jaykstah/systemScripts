#!/bin/bash
export XDG_CURRENT_DESKTOP=sway

#exec /usr/bin/sway "$@"
dbus-run-session -- sway
