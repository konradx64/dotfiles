#!/bin/sh
# /etc/greetd/tuigreet.sh — started by greetd (see /etc/greetd/config.toml).
# Prepares the login screen's console (tty1 only), then starts tuigreet.
# Layout/options live in /etc/tuigreet/config.toml.

# Normal-size text: Terminus 8x16 (sharper than the default font). Bigger: sun12x22
# Other fonts: ls /usr/share/kbd/consolefonts  (avoid 512-glyph ones, they lose colors)
setfont Lat2-Terminus16 2>/dev/null

# Console colors = your Hyprland theme (same palette as Alacritty).
# Format: ESC ] P <index 0-f> <RRGGBB>.  tuigreet's theme names map to these:
# black=0 red=1 green=2 yellow=3 blue=4 magenta=5 cyan=6 gray=7
# darkgray=8 lightred=9 lightgreen=a lightyellow=b lightblue=c lightmagenta=d lightcyan=e white=f
c() { printf '\033]P%s%s' "$1" "$2"; }
c 0 0f1417   # background
c 1 ffb1c7
c 2 9bd4a1
c 3 dbc66e
c 4 90cef4   # accent (borders, prompts, clock)
c 5 d8bafa
c 6 87d1ea
c 7 c0c7cd
c 8 8b9297   # muted (hints at the bottom)
c 9 ffd9e2
c a b6f1bb
c b f8e287
c c c9e6ff
c d eedbff
c e b4ebff
c f dfe3e7   # main text
printf '\033[H\033[2J'   # repaint the screen with the new background

exec tuigreet --config /etc/tuigreet/config.toml
