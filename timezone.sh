#!/bin/bash

set -euo pipefail

Zone="$(curl -s https://ipapi.co/timezone | tr -d '\r' )"
echo "Your timezone is: $Zone" 


