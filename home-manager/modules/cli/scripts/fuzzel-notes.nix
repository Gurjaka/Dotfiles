{pkgs}:
pkgs.writeShellScriptBin "fuzzel-notes" ''
  DIR="$HOME/Documents/Notes"
  mkdir -p "$DIR"

  # Choose terminal dynamically
  term="''${TERMINAL:-foot}"
  command -v "$term" >/dev/null 2>&1 || term=$(command -v kitty || command -v alacritty || command -v wezterm || command -v xterm)

  # Get list of .md files and format them with icon
  entries=$(find "$DIR" -maxdepth 1 -type f -name "*.md" -printf "📝 %f\n" | sort)

  # Add "create new" and "delete" options on top
  options="📄 Create New Note\n🗑️ Delete Note\n$entries"

  # Launch Fuzzel
  selection=$(echo -e "$options" | fuzzel --dmenu --prompt "📝 Notes: ")

  # Exit if nothing selected
  [ -z "$selection" ] && exit

  # Handle Create
  if [[ "$selection" == "📄 Create New Note" ]]; then
      # Prompt for new note name with Fuzzel, but empty list
      new_name=$(printf "\u200B" | fuzzel --dmenu --prompt "📄 New note name: ")

      [ -z "$new_name" ] && exit
      file="$DIR/$new_name.md"
      [ -e "$file" ] || touch "$file"
      "$term" -e nvim "$file" &
      exit
  fi

  # Handle Delete
  if [[ "$selection" == "🗑️ Delete Note" ]]; then
      delete_target=$(find "$DIR" -maxdepth 1 -type f -name "*.md" -printf "📝 %f\n" | sort | fuzzel --dmenu --prompt "🗑️ Select note to delete: ")
      [ -z "$delete_target" ] && exit
      filename="''${delete_target#📝 }"
      rm -f "$DIR/$filename"
      exit
  fi

  # Otherwise, open selected note
  filename="''${selection#📝 }"
  "$term" -e nvim "$DIR/$filename" &
''
