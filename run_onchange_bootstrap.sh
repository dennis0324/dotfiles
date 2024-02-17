#!/bin/bash

if command -v ansible-playbook &> /dev/null; then
    ansible-playbook {{ joinPath .chezmoi.sourceDir "dot_bootstrap/setup.yml" | quote }} --ask-become-pass
fi
