{host, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      direnv hook fish | source
    '';
    shellAliases = {
      "v" = "nvim";
      "cd" = "z";
      "ns" = "nix-shell --command fish -p";
      "ls" = "eza --icons";
      "fetch" = "fastfetch";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/Dotfiles#${host}";
      "update" = "sudo nix flake update --flake ~/Dotfiles";
      "rprofile" = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
      "garbage" = "sudo nix-collect-garbage -d";
      "ufda" = "echo 'use flake' | tee .envrc && direnv allow";
      "za" = "zathura";
    };
  };
}
