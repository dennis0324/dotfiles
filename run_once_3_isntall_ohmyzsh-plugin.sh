#!/bin/bash

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/ ]; then
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/
fi
