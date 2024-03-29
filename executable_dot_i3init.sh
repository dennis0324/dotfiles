#!/usr/bin/env bash


# mouse sensitive
# xinput set-prop 15 "Coordinate Transformaton Matrix" 1,0,0,0,1,0,0,0,3

# execute xborders
#xborders --config "$HOME/.config/xborders/config.json"

# disable screen saver
xset s off
xset -dpms

fcitx5 -d &


screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)
if [[ $screens == *"DP-4"* ]]; then
  xrandr --output "DP-4" --primary
fi
# flameshot

# source $HOME/.venv/bin/activate
