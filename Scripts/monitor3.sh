#!/bin/sh
xrandr --output HDMI-0 --mode 1920x1080 --rate 75 --left-of DP-0 --output DP-0 --primary --mode 1920x1080 --rate 144 --left-of DP-2 --output DP-2 --mode 1920x1080 --rate 144 

killall barrier 
./polystart.sh

i3-msg restart