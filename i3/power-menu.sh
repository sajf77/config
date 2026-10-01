#!/bin/bash
option=$(echo -e "Shutdown\nReboot\nLogout\nSuspend" | rofi -dmenu -p "Power" -font "Iosevka Nerd Font 14" -columns 2 -width 20)

case "$option" in
    *Shutdown) shutdown now ;;
    *Reboot) reboot ;;
    *Logout) i3-msg exit ;;
    *Suspend) systemctl suspend ;;
esac
