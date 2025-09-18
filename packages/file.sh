#!/bin/bash

rm ./.log_packages
rm ./.log_pacman
rm ./not_installed

pacman -R bat yt-dlp mpv nano

source ./packages
names+=("bat")
declare -a not_installed
not_installed=()
pm_install() {
  sudo pacman -S --noconfirm "$1" &>./.log_pacman
}
for pkg in "${names[@]}"; do
  sudo pacman -Q "$pkg" &>/dev/null
  if [[ "$?" -ne 0 ]]; then
    echo -e "\033[3;38;5;196mPackage $pkg isn't installed\033[0m" >>.log_packages
    not_installed+=("$pkg")
  else
    echo -e "\033[3;38;5;82mthe package $pkg is installed\033[0m" >>.log_packages
  fi
done

for pkg in "${names[@]}"; do
  if ! sudo pacman -Q "$pkg" &>/dev/null; then
    echo -e "\033[3;38;5;196mPackage $pkg isn't installed\033[0m" >>.log_packages
    not_installed+=("$pkg")
  else
    echo -e "\033[3;38;5;82mthe package $pkg is installed\033[0m" >>.log_packages
  fi
  typeset -p not_installed >./not_installed
done

for pkg in "${not_installed[@]}"; do
  pm_install "$pkg"
  echo -e "\033[3;38;5;82mInstalling $pkg\033[0m"
done
