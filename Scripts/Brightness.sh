#!/bin/sh

gnome-terminal -e "pwd"

read -p "Enter in brightness level (0.0 - 1.0)" bright


xrandr --output eDP-1 --brightness $bright
