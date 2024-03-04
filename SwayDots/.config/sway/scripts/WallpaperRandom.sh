#!/bin/bash

wallDIR="/home/gurami/Pictures/wallpapers"
scriptsDir="/home/gurami/.config/sway/scripts"

PICS=($(find ${wallDIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}


# Transition config
FPS=60
TYPE="grow"
DURATION=1
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-pos top-right --transition-duration $DURATION --transition-bezier $BEZIER"

swww query || swww init && swww img ${RANDOMPICS} $SWWW_PARAMS

