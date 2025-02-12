#!/usr/bin/env bash

# mouse sensitive
# xinput set-prop 15 "Coordinate Transformaton Matrix" 1,0,0,0,1,0,0,0,3

# execute xborders
#xborders --config "$HOME/.config/xborders/config.json"

# disable screen saver
xset s off
xset -dpms
xrandr --output DP-3 --mode 2560x1440 --rate 143.97 --right-of DP-2 --output DP-2 --mode 2560x1440 --rate 143.97 --primary

fcitx5 -d &

# source $HOME/.venv/bin/activate
