#!/bin/bash
for i in {0..255}; do
  printf "\033[38;5;%sm%4s" $i $i
  (( (i+1) % 16 == 0 )) && echo
done
echo -e "\033[0m"
