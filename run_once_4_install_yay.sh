#!/bin/bash
# install ayay

if ! command -v yay &>/dev/null; then
	if [ ! -d ~/tmp ]; then
		mkdir ~/tmp/
	fi
	git clone https://aur.archlinux.org/yay.git ~/tmp/yay
	cd ~/tmp/yay
	makepkg -si
	rm -rf ~/tmp/yay
fi
