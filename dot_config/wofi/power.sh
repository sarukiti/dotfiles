#!/bin/bash

entries="⇠ logout\n⏾ suspend\n⭮ reboot\n⏻ shutdown"

selected=$(echo $entries|wofi -G --dmenu | awk '{print tolower($2)}')

case $selected in
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
