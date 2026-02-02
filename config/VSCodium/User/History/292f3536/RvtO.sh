#!/bin/bash
cd /etc/nixos && sudo nix-collect-garbage ; nix flake update && sudo nixos-rebuild boot && echo -e "\e[1;32mTASK SUCCESSFUL: \e[0;32mReboot to apply changes. \e[1;30m"