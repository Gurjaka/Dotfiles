{pkgs}:
pkgs.writeShellScriptBin "toggle-theme" ''
  set -e
  FLAKE_DIR="$HOME/Dotfiles"
  FLAKE="$FLAKE_DIR/flake.nix"
  THEMES_FILE="$FLAKE_DIR/themes/default.nix"

  # Check if themes file exists
  if [ ! -f "$THEMES_FILE" ]; then
   echo "Themes file not found at $THEMES_FILE"
   exit 1
  fi

  # Extract available themes from themes.nix (only theme names, not attributes)
  available_themes=$(sed -n 's/^[[:space:]]*\([a-zA-Z_][a-zA-Z0-9_]*\)[[:space:]]*=[[:space:]]*{.*$/\1/p' "$THEMES_FILE" | grep -v -E '^(pkgs|colors|gtk|icon|package|name|nvim|settings|message)$')

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

  # Add icons to themes and present in fuzzel menu
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
    "gruvbox")
      icon="🔥"
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

  # Present themes in fuzzel menu
  selected_with_icon=$(echo -e "$themed_list" | ${pkgs.fuzzel}/bin/fuzzel --dmenu --prompt "Select theme: ")

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
  killall conky 2>/dev/null || true
  find ~/.config/ghostty 2>/dev/null | ${pkgs.entr}/bin/entr pkill -SIGUSR2 ghostty &
  killall entr || true
  killall .swaync-wrapped 2>/dev/null || true
  swaync &
  qtile cmd-obj -o root -f reload_config || true
  echo "$selected" > "$HOME/.cache/current_theme_nvim" || true
  wallrandom || true

  message=$(sed -n "/$selected = {/,/};/s/.*message *= *\"\(.*\)\";.*/\1/p" "$FLAKE_DIR/themes/default.nix")

  notify-send \
  	"🎨 $selected Theme" \
  	"$message" \
  	--icon="$FLAKE_DIR/themes/icons/$selected.svg" \
  	--urgency=normal \
  	--expire-time=5000
''
