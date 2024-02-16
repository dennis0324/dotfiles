#!/usr/bin/env bash

## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)

dir="/home/dennis/.config/rofi/launchers/power_launcher"
theme='style-6'

## Run
rofi \
	-show power-menu \
	-modi "power-menu:/home/dennis/.local/bin/rofi-power-menu --choices=shutdown/reboot/logout/suspend/window" \
	-theme ${dir}/config.rasi
