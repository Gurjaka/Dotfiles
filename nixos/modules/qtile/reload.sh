#!/bin/sh
killall .swaync-wrapped conky electron .spotify-wrapped foot
foot --server
swaync &
conky -c ~/.config/conky/conky-qtile.conf &
vesktop &
