#!/usr/bin/env sh
xrandr --output HDMI-0 --primary --mode 1920x1080 --rate 75 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output DP-3 --off

killall -q polybar

Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -c ~/.config/polybar/oneMonitor example &

killall barrier 
barrier &

i3-msg restart