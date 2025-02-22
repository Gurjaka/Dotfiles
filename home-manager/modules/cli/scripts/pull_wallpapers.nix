{pkgs}:
pkgs.writeShellScriptBin "pull_wallpapers" ''
  DIR="$HOME/.config/wallpapers"
  REPO_URL="https://github.com/Gurjaka/Nord-Wallpapers.git"

  if [[ -d "$DIR" ]]; then
      echo "Directory $DIR exists."
      echo "Moving to $DIR"
      cd "$DIR" || { echo "Failed to change directory."; exit 1; }

      if [[ -d .git ]]; then
          echo "Pulling new wallpapers."
  				echo ""
          git pull
      else
          echo "Directory exists but is not a Git repository."
      fi
  else
      echo "Directory $DIR does not exist. Cloning remote repository."
  		echo ""
      git clone "$REPO_URL" "$DIR"
  fi
  echo ""
  echo "Operation completed successfully."
''
