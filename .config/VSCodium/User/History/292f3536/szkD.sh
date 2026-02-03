#!/bin/bash



cd /etc/nixos && sudo nix-collect-garbage ; sudo nix-channel --update ; sudo nixos-rebuild boot && echo -e "\e[1;32mTASK SUCCESSFUL: \e[0;32mReboot to apply changes. \e[1;30m"
