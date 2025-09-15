#!/bin/bash

set -euo pipefail

if [[ -f ./.zshrc ]]; then
  sudo mv ./.zshrc zshrc
fi
