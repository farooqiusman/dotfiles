#!/bin/sh

bg_color=#4E4675
fg_color=#000000
border_color=#36301f
text_color=#f3f4f5
htext_color=#000000

rofi -show run -modi run -lines 8 -eh 1 -width 25 -padding 20 -bw 5 -color-window "$bg_color, $fg_color, $border_color" -color-normal "$bg_color, $text_color, $bg_color, $bg_color, $htext_color" -font "Sans 16"
