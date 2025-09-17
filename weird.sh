#!/Users/abdulkadirhassan/.local/bin/bash

source ./functions
project_dir=$(pwd)
log_start
home="$HOME/.config"
config_home="$HOME/.config/bash/blesh"
local_home="$HOME/.local/share/blesh"
Project_home="/Volumes/Shallow/Projects/Bash/automation/Fresh_Install/tmp"

#createdir "$Project_home"

echo "works" >>./.log
get_cwd() {
  cd "$1" || echo "cd failed parent directory doesn't exist" >>./.log && return 1
  cd ../
  pwd
}
get_cwd "$home"
echo "works through and through" >>"$project_dir"/.log

#checkdir $local_home

#file() {
#  if [[ ! -d $1 ]]; then
#    mkdir -p "$1"
#    echo -e "\033[3;34m$Project_home\0330m"
#  fi
#}
#echo -e "\033[3;38;5;82m$Project_home\033[0m"
#echo "$Project_home"

#if ! command -v gawk >/dev/null 2>&1; then
#  echo "gawk isn't installed"
#  brew install gawk >/dev/null 2>&1
#fi
#
#if [[ ! -f "$config_home"/ble.sh ]]; then
#  if [[ ! -f "$local_home"/ble.sh ]]; then
#    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
#    make -C ble.sh install PREFIX=~/.local
#  else
#    if [[ -d "$config_home" ]]; then
#      mv "$local_home"/ble.sh "$config_home"/
#    else
#      mkdir -p "$config_home"
#      mv "$local_home"/ble.sh "$config_home"/
#    fi
#  fi
#fi
log_stop
