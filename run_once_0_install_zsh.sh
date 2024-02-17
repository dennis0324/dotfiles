#!/bin/bash

install_on_arch() {
	pacman -S zsh
}
install_on_mac() {
	brew install zsh
}

OS="$(uname -s)"
case "${OS}" in
Linux*)
	if [ -f /etc/arch-release ]; then
		install_on_arch
	else
		echo "Unsupported Linux distribution"
		exit 1
	fi
	;;
Darwin*)
	install_on_mac
	;;
*)
	echo "Unsupported operating system: ${OS}"
	exit 1
	;;
esac

echo "Zsh installation complete."
