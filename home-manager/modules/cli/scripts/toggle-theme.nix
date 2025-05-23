{pkgs}:
pkgs.writeShellScriptBin "toggle-theme" ''
  set -e

  FLAKE=$HOME/Dotfiles/flake.nix
  FLAKE_DIR=$HOME/Dotfiles

  # Detect current theme
  current=$(grep 'colorscheme = "' "$FLAKE" | sed -E 's/.*"([^"]+)".*/\1/')

  # Determine new theme
  if [[ "$current" == "nord" ]]; then
  	new="everforest"
  elif [[ "$current" == "everforest" ]]; then
  	new="nord"
  else
  	echo "Unknown theme: $current"
  	exit 1
  fi

  # Replace in file
  sed -i "s/colorscheme = \"$current\";/colorscheme = \"$new\";/" "$FLAKE"

  # Apply the new config
  nix run $FLAKE_DIR#homeConfigurations.gurami.activationPackage

  qtile cmd-obj -o root -f reload_config
  wallrandom

  echo "Theme switched from $current to $new."
''
