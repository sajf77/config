#!/bin/sh

window_id=$(xprop -root _NET_ACTIVE_WINDOW 2>/dev/null | awk '{print $5}')

if [ -z "$window_id" ] || [ "$window_id" = "0x0" ]; then
    exit 0
fi

app_class=$(xprop -id "$window_id" WM_CLASS 2>/dev/null \
    | sed -n 's/.*"[^"]*",[[:space:]]*"\([^"]*\)".*/\1/p')

if [ -z "$app_class" ]; then
    exit 0
fi

case "$(printf '%s' "$app_class" | tr '[:upper:]' '[:lower:]')" in
    firefox) icon='' ;;
    chromium|google-chrome|google-chrome-stable) icon='' ;;
    code|codium) icon='󰨞' ;;
    kitty|alacritty|xterm|st|wezterm|gnome-terminal) icon='' ;;
    thunar|nautilus|dolphin|pcmanfm) icon='' ;;
    discord) icon='' ;;
    spotify) icon='' ;;
    steam) icon='' ;;
    libreoffice*|soffice) icon='' ;;
    *) icon='󰖲' ;;
esac

printf '%s  %s\n' "$icon" "$app_class"
