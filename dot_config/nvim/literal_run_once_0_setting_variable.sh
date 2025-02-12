#!/bin/bash

serverValue="x11"
if [ ! -f ~/.local/share/chezmoi/.chezmoidata.toml ]; then
	touch ~/.local/share/chezmoi/.chezmoidata.toml
fi

checkserver=$(cat ~/.local/share/chezmoi/.chezmoidata.toml | grep server)

if [ -z "$checkserver" ]; then
	echo "server = \"$serverValue\"" >>~/.local/share/chezmoi/.chezmoidata.toml
fi
