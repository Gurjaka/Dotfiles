{
  host,
  pkgs,
  ...
}: {
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
      "rebuild" = "sudo nixos-rebuild switch --flake ~/Dotfiles#${host}";
      "update" = "sudo nix flake update --flake ~/Dotfiles";
      "rprofile" = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
      "garbage" = "sudo nix-collect-garbage -d";
      "ufda" = "echo 'use flake' | tee .envrc && direnv allow";
      "za" = "zathura";
    };
    plugins = [
      {
        name = "fish-ssh-agent";
        src = pkgs.fetchFromGitHub {
          owner = "danhper";
          repo = "fish-ssh-agent";
          rev = "f10d95775352931796fd17f54e6bf2f910163d1b";
          sha256 = "sha256-cFroQ7PSBZ5BhXzZEKTKHnEAuEu8W9rFrGZAb8vTgIE=";
        };
      }
    ];
  };
}
