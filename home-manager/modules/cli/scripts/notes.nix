{pkgs}:
pkgs.writeShellScriptBin "rofi-notes" ''
  DIR="$HOME/Documents/Notes"
  mkdir -p "$DIR"

  # Choose terminal dynamically
  term="''${TERMINAL:-foot}"
  command -v "$term" >/dev/null 2>&1 || term=$(command -v kitty || command -v alacritty || command -v wezterm || command -v xterm)

  # Get list of .md files and format them with icon
  entries=$(find "$DIR" -maxdepth 1 -type f -name "*.md" -printf "📝 %f\n" | sort)

  # Add "create new" and "delete" options on top
  options="📄 Create New Note\n🗑️ Delete Note\n$entries"

  # Launch Rofi
  selection=$(echo -e "$options" | rofi -dmenu -i -p "🗒 Notes")

  [ -z "$selection" ] && exit

  # Handle Create
  if [[ "$selection" == "📄 Create New Note" ]]; then
      new_name=$(rofi -dmenu -p "New note name (no .md):")
      [ -z "$new_name" ] && exit
      file="$DIR/$new_name.md"
      [ -e "$file" ] || touch "$file"
      "$term" -e nvim "$file" &
      exit
  fi

  # Handle Delete
  if [[ "$selection" == "🗑️ Delete Note" ]]; then
      delete_target=$(find "$DIR" -maxdepth 1 -type f -name "*.md" -printf "📝 %f\n" | sort | rofi -dmenu -i -p "🗑 Select note to delete:")
      [ -z "$delete_target" ] && exit
      filename="''${delete_target#📝 }"
      rm -f "$DIR/$filename"
      exit
  fi

  # Otherwise, open selected note
  filename="''${selection#📝 }"
  "$term" -e nvim "$DIR/$filename" &
''
