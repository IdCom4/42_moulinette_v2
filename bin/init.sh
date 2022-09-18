#!/bin/bash
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "export PATH=\"\$PATH:${SCRIPT_PATH}\"" >> ~/.bashrc
echo "[[ -s ~/.bashrc ]] && source ~/.bashrc" >> ~/.bash_profile

source ~/.bashrc