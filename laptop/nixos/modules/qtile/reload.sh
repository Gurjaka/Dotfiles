#!/bin/sh
killall .swaync-wrapped conky 
swaync &
conky -c ~/.config/conky/conky-qtile.conf &
