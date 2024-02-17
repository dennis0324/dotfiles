#!/bin/bash

if command -v ansible-playbook &>/dev/null; then
	ansible-playbook {{ joinPath.chezmoi.sourceDir "dot_bootstrap/setup.yml" }} --ask-become-pass
fi
