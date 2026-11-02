#!/usr/bin/env bash
# Waybar power-profile toggle (uses power-profiles-daemon).
#   power-profile.sh        print current profile as JSON for Waybar
#   power-profile.sh next   cycle: power-saver -> balanced -> performance -> ...
# Icons are written as escape codes ($'\uXXXX') so they can't get lost in editing.

if [[ "${1:-}" == "next" ]]; then
    case "$(powerprofilesctl get)" in
        power-saver) powerprofilesctl set balanced ;;
        balanced)    powerprofilesctl set performance ;;
        *)           powerprofilesctl set power-saver ;;
    esac
    pkill -RTMIN+8 -x waybar   # tell Waybar to refresh this module now
    exit 0
fi

profile=$(powerprofilesctl get)
case "$profile" in
    performance) icon=$''; label="Performance" ;;   # bolt
    balanced)    icon=$''; label="Balanced" ;;      # scale
    power-saver) icon=$''; label="Power saver" ;;   # leaf
    *)           icon="?";       label="$profile" ;;
esac
printf '{"text":"%s","alt":"%s","class":"%s","tooltip":"Power profile: %s\\nClick to switch"}\n' \
    "$icon" "$profile" "$profile" "$label"
