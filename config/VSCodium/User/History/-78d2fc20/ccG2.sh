#!/bin/bash
alacritty msg create-window
cd /etc/nixos && sudo nix-collect-garbage && nix flake update && sudo nixos-rebuild switch && echo -e "\e[1;32mTASK SUCCESSFUL: \e[0;32mReboot recommended. \e[1;30m"