#!/bin/sh


bg_color=#292C2F
fg_color=#B18D68
border_color=#36301f
text_color=#f3f4f5
htext_color=#B18D68
rofi -show drun -lines 3 -eh 2 -width 25 -padding 55 -opacity 30 -bw 5 -color-window "$bg_color, $fg_color, $border_color" -color-normal "$bg_color, $text_color, $bg_color, $bg_color, $htext_color" -font "Sans 18"
