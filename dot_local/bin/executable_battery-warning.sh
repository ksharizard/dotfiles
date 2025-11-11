#!/bin/bash

battery_stat="$(cat /sys/class/power_supply/BAT0/capacity)"
battery_greped_status="$(cat /sys/class/power_supply/BAT0/status)"

if [ "$battery_greped_status" == "Discharging" ]; then
  if [ "$battery_stat" -gt 15 ] && [ "$battery_stat" -lt 45 ]; then
    notify-send "Battery is low!" "Charge level: $battery_stat"
  elif [ "$battery_stat" -lt 15 ]; then
    notify-send "Battery is critcally low!" "Charge level: $battery_stat"
  fi

elif [ "$battery_greped_status" == "Charging" ]; then
  if [ "$battery_stat" -ge 80 ]; then
    notify-send "Battery is charged" "Charge level: $battery_stat"
  fi
fi
