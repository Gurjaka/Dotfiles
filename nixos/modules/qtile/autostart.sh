#!/bin/sh
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
systemctl --user restart pipewire &
foot --server &
swaync &
udiskie &
flameshot & 
conky -c ~/.config/conky/conky-qtile.conf &
