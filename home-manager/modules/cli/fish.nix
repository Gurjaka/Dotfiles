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
  };
}
