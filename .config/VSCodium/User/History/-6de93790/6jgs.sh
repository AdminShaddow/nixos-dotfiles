#!/bin/bash
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
battery_charg=`acpi -b | grep -P -o 'Discharging'`
if [ $battery_level -le 10 ] && [ $battery_charg ]; then
    dunstify --urgency=critical "Battery level is ${battery_level}%!"
fi
