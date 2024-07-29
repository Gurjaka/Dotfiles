{  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      direnv hook fish | source
    '';
    shellAliases = {
      "fetch" = "fastfetch";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/Dotfiles#desktop";
      "update" = "sudo nix flake update ~/Dotfiles";
      "garbage" = "sudo nix-collect-garbage -d";
    };
  };
}