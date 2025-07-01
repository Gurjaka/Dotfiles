{pkgs}:
pkgs.writeShellScriptBin "wallrandom" ''
  set -e

  FLAKE=$HOME/Dotfiles/flake.nix
  FLAKE_DIR=$HOME/Dotfiles

  # Detect current theme
  current=$(grep 'colorscheme = "' "$FLAKE" | sed -E 's/.*"([^"]+)".*/\1/')

  DIR=$HOME/.config/wallpapers/$current
  PICS=($(ls ''${DIR}))

  RANDOMPICS=''${PICS[ $RANDOM % ''${#PICS[@]} ]}

  swww query || swww-daemon

  #change-wallpaper using swww
  swww img ''${DIR}/''${RANDOMPICS} --transition-fps 165 --transition-type grow  --transition-pos 0.2,0.2 --transition-duration 1
''
