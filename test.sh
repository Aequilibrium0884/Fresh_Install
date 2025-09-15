#!/bin/bash

set -euo pipefail

Zone="$(curl -s https://ipapi.co/timezone | tr -d '\r')"
sys_zone="$(timedatectl show --property=Timezone --value)"

if [ "$sys_zone" != "$Zone" ]; then
  echo "Timezone is incorrect"
  echo "Your timezone is: $Zone"
else
  echo "Your System Is Set to the correct Timezone"
fi
