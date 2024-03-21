#!/bin/bash

echo "[password for vault]"
pass_yml=$(ansible-vault view ~/.bootstrap/secret.yml)
pass=(${pass_yml//:/})
if [[ -d ~/.secret/pw/ ]]; then
	mkdir -p ~/.secret/pw
fi
if [[ -f ~/.secret/pw/wheel ]]; then
	touch ~/.secret/pw/wheel
fi
echo ${pass[2]} >~/.secret/pw/wheel
# ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass
