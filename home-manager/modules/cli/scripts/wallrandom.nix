{pkgs}:
pkgs.writeShellScriptBin "wallrandom" ''
  set -e

  DIR=$HOME/.config/wallpapers
  PICS=($(ls ''${DIR}))

  RANDOMPICS=''${PICS[ $RANDOM % ''${#PICS[@]} ]}

  swww query || swww-daemon

  #change-wallpaper using swww
  swww img ''${DIR}/''${RANDOMPICS} --transition-fps 120 --transition-type grow  --transition-pos 0.2,0.2 --transition-duration 1
''
