#!/bin/bash

echo "Ansible installing..."

install_on_arch() {
	sudo pacman -S ansible --noconfirm
}
install_on_mac() {
	brew install ansible
}
if [ $server != "wayland" ]; then
	server=x11
fi

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

ansible-galaxy install -r dot_bootstrap/requirements.yml
ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass --extra-vars "server=$server"

echo "Ansible installation complete."
