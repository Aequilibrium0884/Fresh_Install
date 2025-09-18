#!/bin/env bash

LOG="./.log_pacman"
rm "$LOG"
echo "cleaning script"
################################################
pacq() {
  pacman -Q "$1" &>/dev/null
}
pacS() {
  sudo pacman -S --noconfirm "$1" >/dev/null 2>>"$LOG"
}
pacs() {
  pacman -Si "$1" >/dev/null 2>>"$LOG"
}
#################################################

declare -a not_found_package
not_found_package=()
declare -a found_package
found_package=()
declare -a package
package=("tuppleware" "bat" "vlc")
count="${#package[@]}"

echo "count = $count"
sleep 1
#################################################

echo -e "checking if package is in aur\n"

for pkg in "${package[@]}"; do
  if ! pacs "$pkg"; then
    echo "package is not in the aur"
    ((pkg_count++))
    not_found_package+=("$pkg")
    continue
  else
    echo "$pkg is in the aur"
    found_package+=("$pkg")
  fi
done

printf "packages found are\n" 
for pkg in "${found_package}"; do
  count_f=1
  printf "%d-%s\n" "$count_f" "$pkg"
  (( count_f++ ))
done
pkg_count=0

echo -e "starting ensured installed until loop\n"
until [[ $pkg_count -eq $count ]]; do
  pkg_count=0
  for npkg in "${not_found_package[@]}"; do
    if ! pacq "$npkg"; then
      else
        echo "package is already installed"
        ((pkg_count++))
      fi
    pacS "$pkg"
    echo -e "installing package $pkg\n"
    fi
  done
done
echo -e "finished ensured installed until loop\n"

echo -e "packages that couldn't be found are:\n"

for npkg in "${not_found_package[@]}"; do
  printf "%s\n" "$npkg"
done
