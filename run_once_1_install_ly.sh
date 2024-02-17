#!/bin/bash

install_on_arch() {
	pacman -S ly --noconfirm
}

OS="$(uname -s)"
case "${OS}" in
Linux*)
	if [ -f /etc/arch-release ]; then
		install_on_arch
	else
		echo "Skipping ly due to linux distribution"
		exit 1
	fi
	;;
*)
	echo "Skipping ly due to unsupported operating system: ${OS}"
	exit 1
	;;
esac

systemctl enable ly.service --now

echo "Ly installation complete."
