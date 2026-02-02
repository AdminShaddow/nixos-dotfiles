#!/bin/bash

nix-collect-garbage ; nix-store --optimise ;

sudo nix-channel --update ; sudo nixos-rebuild boot && echo -e "\e[1;32mTASK SUCCESSFUL: \e[0;32mReboot is recommended. \e[1;30m"
