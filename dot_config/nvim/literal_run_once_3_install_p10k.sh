#!/bin/bash
#
if [ ! -d ~/.config/powerlevel10k/ ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/powerlevel10k
fi
