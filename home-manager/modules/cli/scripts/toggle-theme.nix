{pkgs}:
pkgs.writeShellScriptBin "toggle-theme" ''
  set -e

  FLAKE="$HOME/Dotfiles/flake.nix"
  FLAKE_DIR="$HOME/Dotfiles"

  # Detect current theme
  current=$(grep -Eo 'colorscheme\s*=\s*"[^"]+"' "$FLAKE" | sed -E 's/.*"([^"]+)".*/\1/')
  if [ -z "$current" ]; then
    echo "Could not detect current theme from flake.nix."
    exit 1
  fi

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
  sed -i -E "s/colorscheme\s*=\s*\"$current\";/colorscheme = \"$new\";/" "$FLAKE"

  # Apply the new config
  echo "Applying configuration..."
  nh home switch $HOME/Dotfiles
  echo "Configuration applied"

  # Restart relevant components
  killall foot 2>/dev/null || true
  echo "Successfully restarted foot server"
  foot --server &
  killall conky
  conky -c ~/.config/conky/conky-qtile.conf &
  killall .swaync-wrapped
  swaync &

  qtile cmd-obj -o root -f reload_config || true
  wallrandom || true

  echo "Theme switched from $current to $new."
''
