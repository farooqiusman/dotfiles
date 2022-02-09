#!/usr/bin/env bash

# Script to start all Lux HUD conky widgets.
# As you can see below all conky processes gets killed
# first before running since this is a collection that takes
# up the whole desktop. Feel free to modify this for you needs.
# Author: Mikael Luxwarp Carlsson mikael.m.carlsson@gmail.com https://codeiolo.org
# License: ISC.

# Let the desktop load for a few seconds before running

# Kill all current conky processes.
killall conky
sleep 0.3
# Starting all lux-hud conky widgets.
conky -c ~/.config/conky/lux-hud/conky.conf &
