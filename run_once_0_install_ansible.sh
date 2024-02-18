#!/bin/bash

install_on_arch() {
	pacman -S ansible --noconfirm
}
install_on_mac() {
	brew install ansible
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

ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "Ansible installation complete."
