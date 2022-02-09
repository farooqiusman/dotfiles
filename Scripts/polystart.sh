#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

#------------------------------------------------------------------------
#                   for dual polybars 1 on each monitor
 Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ $m == 'DP-0' ]
    then
      MONITOR=$m polybar -c ~/.config/polybar/config example &
    elif [ $m == 'DP-2' ]
    then
      MONITOR=$m polybar -c ~/.config/polybar/bar2.conf example &
    elif [ $m == 'HDMI-0' ]
    then
      MONITOR=$m polybar -c ~/.config/polybar/bar3.conf example &
    fi
  done
else
  polybar --reload ~/.config/polybar/config example &
fi
-------------------------------------------------------------------------
#polybar -c ~/.config/polybar/config example &
