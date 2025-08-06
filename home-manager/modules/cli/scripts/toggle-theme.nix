{pkgs}:
pkgs.writeShellScriptBin "toggle-theme" ''
  set -e
  FLAKE="$HOME/Dotfiles/flake.nix"
  FLAKE_DIR="$HOME/Dotfiles"
  THEMES_FILE="$HOME/Dotfiles/themes.nix"

  # Check if themes file exists
  if [ ! -f "$THEMES_FILE" ]; then
   echo "Themes file not found at $THEMES_FILE"
   exit 1
  fi

  # Extract available themes from themes.nix (only theme names, not attributes)
  available_themes=$(sed -n 's/^[[:space:]]*\([a-zA-Z_][a-zA-Z0-9_]*\)[[:space:]]*=[[:space:]]*{.*$/\1/p' "$THEMES_FILE" | grep -v -E '^(pkgs|colors|gtk|icon|package|name)$')

  if [ -z "$available_themes" ]; then
   echo "No themes found in $THEMES_FILE"
   exit 1
  fi

  # Detect current theme using a simpler approach
  current=$(grep 'colorscheme.*=' "$FLAKE" | cut -d'"' -f2)
  if [ -z "$current" ]; then
   echo "Could not detect current theme from flake.nix."
   exit 1
  fi

  # Add icons to themes and present in rofi menu
  themed_list=""
  while IFS= read -r theme; do
   case "$theme" in
  	 "nord")
  		 icon="❄️"
  		 ;;
  	 "everforest")
  		 icon="🌲"
  		 ;;
  	 "kanagawa")
  		 icon="🌸"
  		 ;;
  	 *)
  		 icon="🎨"
  		 ;;
   esac

   if [ "$theme" = "$current" ]; then
  	 themed_list="$themed_list$icon $theme (current)\n"
   else
  	 themed_list="$themed_list$icon $theme\n"
   fi
  done <<< "$available_themes"

  # Present themes in rofi menu
  selected_with_icon=$(echo -e "$themed_list" | rofi -dmenu -p "Select theme:" -i)

  # Extract just the theme name from the selection (remove icon and any extra text)
  selected=$(echo "$selected_with_icon" | sed 's/^[^[:space:]]* //' | sed 's/ (current)$//')

  # Check if user cancelled selection
  if [ -z "$selected" ]; then
   echo "No theme selected. Exiting."
   exit 0
  fi

  # Check if selected theme is different from current
  if [ "$selected" = "$current" ]; then
   echo "Selected theme is already active: $selected"
   exit 0
  fi

  # Validate that selected theme exists in themes file
  if ! echo "$available_themes" | grep -q "^$selected$"; then
   echo "Invalid theme selected: $selected"
   exit 1
  fi

  # Replace in flake.nix using a simpler sed command
  sed -i "s/colorscheme = \"$current\"/colorscheme = \"$selected\"/" "$FLAKE"

  # Apply the new config
  echo "Applying configuration..."
  nh home switch $HOME/Dotfiles
  echo "Configuration applied"

  # Restart relevant components
  killall foot 2>/dev/null || true
  echo "Successfully restarted foot server"
  foot --server &
  killall conky 2>/dev/null || true
  systemctl reload --user app-com.mitchellh.ghostty.service
  conky -c ~/.config/conky/conky-qtile.conf &
  killall .swaync-wrapped 2>/dev/null || true
  swaync &
  qtile cmd-obj -o root -f reload_config || true
  wallrandom || true

  echo "Theme switched from $current to $selected."
''
