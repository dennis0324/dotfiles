#!/bin/bash

if command -v ansible-playbook &>/dev/null; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
	echo ".oh-my-zsh already found, skipping."
fi
