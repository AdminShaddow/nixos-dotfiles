#!/bin/bash
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
battery_charg=`acpi -b | grep -P -o 'Discharging'`
if [ $battery_level -le 10 ] && [ $battery_charg == true ]; then
    dunstify --urgency=critical "Battery level is ${battery_level}%! PLUG IT IN!"
elif [ $battery_level -eq 100 ] && [ $battery_charg == false ]; then
    dunstify --urgency=critical "Battery level is ${battery_level}%! PLUG IT OUT!"
fi
