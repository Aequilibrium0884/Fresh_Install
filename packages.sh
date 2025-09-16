#!/bin/bash

set -euo pipefail

if [[ -x /usr/sbin/pacman ]]; then
  ins_cmd="pacman -S --noconfirm --needed"
  package_manager="pacman"
elif
  [[ -x /usr/bin/dnf ]]
then
  ins_cmd="dnf -y --skip-broken"
else
  echo "script failed"
fi

if [[ -x /usr/sbin/zsh ]]; then
  shell="zsh"
  echo -e "\033[3;38;2;213;48;55m${shell}\033[0m is installed"
else
  echo -e "installing \033[3;38;2;213;48;55m${shell}........\033[0m"
fi

echo -e "Your package manager is \033[3;38;2;213;48;55m${package_manager}\033[0m"
echo -e "I will use \"\033[3;38;2;213;48;55m${ins_cmd}\033[0m\" to install packages"
