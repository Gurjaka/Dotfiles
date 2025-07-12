{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      direnv hook fish | source
    '';
    loginShellInit = ''
      ssh-add
    '';
    shellAliases = {
      "v" = "nvim";
      "cd" = "z";
      "ns" = "nix-shell --command fish -p";
      "ls" = "eza --icons";
      "fetch" = "fastfetch";
      "os" = "nh os switch ~/Dotfiles";
      "update" = "nix flake update --flake ~/Dotfiles";
      "garbage" = "nh clean all";
      "ufda" = "echo 'use flake' | tee .envrc && direnv allow";
      "za" = "zathura";
      "md" = "mkdir";
      "hs" = "nh home switch ~/Dotfiles";
    };

    functions.showalias.body = ''
      echo -e "\n\033[1;34m───────────[ Your Aliases ]───────────\033[0m\n"

      # Get all aliases and format them
      alias | while read -l line
      # Skip the first word "alias" and split the rest
      set -l parts (string split -m 2 ' ' $line)
      if test (count $parts) -ge 3
      set -l name $parts[2]
      set -l value $parts[3]

      # Remove quotes from value if present
      set value (string trim -c "'" $value)

      printf " \033[1;36m%-20s\033[0m → \033[0;37m%s\033[0m\n" $name $value
      end
      end | sort

      echo -e "\n\033[1;34m──────────────────────────────────────\033[0m\n"
    '';
  };
}
