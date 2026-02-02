#!/bin/bash

dunstify "Brightness  $(brightnessctl -m | cut -d "," -f 4) " -r 23 -t 2000 -h int:value:"$(brightnessctl -m | cut -d "," -f 4)"
