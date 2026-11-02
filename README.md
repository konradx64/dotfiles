# dotfiles

My Arch Linux + Hyprland setup (Hyprland 0.57 with Lua config, Waybar, rofi,
swaync, hyprlock/hypridle, matugen theme, greetd + tuigreet login screen).

## Usage

```sh
dotfiles save            # copy current configs here, commit, push to GitHub
dotfiles save "message"  # same, with your own commit message
dotfiles status          # what changed since the last save
dotfiles restore         # put the saved home configs back (asks first)
```

What gets backed up is listed in [`files.txt`](files.txt) — add a line to back up more.

## Layout

| Folder / file       | What                                                        |
|---------------------|-------------------------------------------------------------|
| `home/`             | configs from `~` (`.config/hypr`, `.config/waybar`, ...)    |
| `system/`           | system files (`/etc/greetd`, boot menu, mkinitcpio, ...)    |
| `packages.txt`      | installed packages from the official repos                  |
| `packages-aur.txt`  | installed AUR packages                                      |

## Restoring on a fresh install

1. Install packages: `sudo pacman -S --needed - < packages.txt`
   (AUR ones from `packages-aur.txt` with `rua`).
2. Clone this repo to `~/dotfiles`, then run `~/dotfiles/dotfiles restore`.
3. Link the command: `ln -s ~/dotfiles/dotfiles ~/.local/bin/dotfiles`
4. Wallpaper: `cp /usr/share/wallpapers/Mountain/contents/images_dark/5120x2880.png ~/Pictures/Wallpapers/mountain.png`
   then `wallpaper ~/Pictures/Wallpapers/mountain.png` to regenerate the theme colors.
5. System files in `system/` are **not** restored automatically — copy what you need with `sudo`.
   Check the `PARTUUID` in `system/boot/loader/entries/*.conf` against `blkid` first,
   and run `sudo mkinitcpio -P` after restoring `mkinitcpio.conf`.
