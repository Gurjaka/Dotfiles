#!/bin/sh
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
swaync &
udiskie &
conky -c ~/.config/conky/conky-qtile.conf &
