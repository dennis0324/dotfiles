#!/usr/bin/env bash

## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)

dir="$HOME/.config/rofi/launchers/app_launcher"

## Run
rofi \
	-show drun \
	-theme ${dir}/config.rasi
