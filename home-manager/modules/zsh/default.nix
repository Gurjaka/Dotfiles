{ pkgs, host, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = ["rm *" "pkill *" "cp *"];
    };

    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
      }
      {
        name = "zsh-autocomplete";
        src = pkgs.zsh-autocomplete;
      }
    ];

    shellAliases = {
      v = "nvim";
      ns = "nix-shell --command fish -p";
      vc = "cd ~/Dotfiles/Vim-Cheatsheet/ && python main.py";
      ls = "eza --icons";
      fetch = "fastfetch";
      rebuild = "sudo nixos-rebuild switch --flake ~/Dotfiles#${host}";
      update = "sudo nix flake update ~/Dotfiles";
      rprofile = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
      garbage = "sudo nix-collect-garbage -d";
      ufda = "echo 'use flake' | tee .envrc && direnv allow";
    };

    oh-my-zsh = {
      enable = true;

      custom = "$HOME/.extra/zsh";
      theme = "theme";

      plugins = [
        "git"
        "ssh-agent"
      ];
    };
    
  };
  home.file.omz_zsh_theme = {
    source = ./theme.zsh-theme;
    target = ".extra/zsh/theme.zsh-theme";
  };
}
