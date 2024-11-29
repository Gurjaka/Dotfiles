#!/bin/sh
killall .swaync-wrapped conky electron .spotify-wrapped
swaync &
conky -c ~/.config/conky/conky-qtile.conf &
vesktop &
