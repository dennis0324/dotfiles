#!/bin/bash

install_on_arch() {
	pacman -S i3 --noconfirm
}

OS="$(uname -s)"
case "${OS}" in
Linux*)
	if [ -f /etc/arch-release ]; then
		install_on_arch
	else
		echo "Skipping i3 due to linux distribution"
		exit 1
	fi
	;;
*)
	echo "Skipping i3 due to unsupported operating system: ${OS}"
	exit 1
	;;
esac

echo "Ansible installation complete."
