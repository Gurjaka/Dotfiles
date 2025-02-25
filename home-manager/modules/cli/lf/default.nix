{pkgs, ...}: {
  xdg.configFile."lf/icons".source = ./icons;
  programs.lf = {
    enable = true;
    commands = {
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
        ''${{
          printf "Directory Name: "
          read DIR
          mkdir $DIR
        }}
      '';
      touch = ''
        ''${{
          printf "File Name: "
          read FILE
          touch $FILE
        }}
      '';
    };
    keybindings = {
      o = "editor-open";
      c = "mkdir";
      t = "touch";
      d = "delete";
      x = "cut";
      "." = "set hidden!";
    };
    settings = {
      preview = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
    extraConfig = let
      previewer = pkgs.writeShellScriptBin "pv.sh" ''
        case "$(${pkgs.file}/bin/file -Lb --mime-type -- "$1")" in
          image/*)
            if [[ "$TERM" == "xterm-kitty" ]]; then
              file=$1
              w=$2
              h=$3
              x=$4
              y=$5

              if [[ "$(${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
                ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file \
                  --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
                exit 1
              fi

              ${pkgs.pistol}/bin/pistol "$file"
            else
              ${pkgs.chafa}/bin/chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
              exit 1
            fi
            ;;
          text/*)
            ${pkgs.bat}/bin/bat -pp --color always --wrap character -- "$1"
            ;;
        esac
      '';

      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        if [[ "$TERM" == "xterm-kitty" ]]; then
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        else
          ${pkgs.killall}/bin/killall chafa 2>/dev/null
        fi
        ${pkgs.killall}/bin/killall bat 2>/dev/null
      '';
    in ''
      set sixel true
      set previewer ${previewer}/bin/pv.sh
      set cleaner ${cleaner}/bin/clean.sh
    '';
  };
}
