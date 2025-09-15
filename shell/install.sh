#!/bin/bash

set -euo pipefail

if [[ -f ./.zshrc ]]; then
  sudo mv zshrc $HOME/.zshrc
fi

if [[ ! -d $HOME/.config ]]; then
  echo 
  sudo mkdir -p $HOME/.config 
fi
# Make Sure to move zsh dir to .config/first

if [[ ! -d $HOME/.config/zsh/plugins/zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.config/zsh/plugins/zsh-autopair
fi

source ~/.zsh-autopair/autopair.zsh
autopair-init

sudo chown -R $USER:$USER $HOME/.config
sudo chmod -R 700 $HOME/.config