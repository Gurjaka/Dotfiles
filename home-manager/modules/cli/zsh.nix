{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [
        "rm *"
        "pkill *"
        "cp *"
      ];
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
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
      }
    ];

    shellAliases = {
      v = "nvim";
      cd = "z";
      ns = "nix-shell --command zsh -p";
      ls = "eza --icons";
      fetch = "fastfetch";
      rebuild = "nh os switch ~/Dotfiles";
      update = "sudo nix flake update --flake ~/Dotfiles";
      garbage = "nh clean all";
      ufda = "echo 'use flake' | tee .envrc && direnv allow";
      za = "zathura";
      md = "mkdir";
      home-switch = "home-manager switch --flake ~/Dotfiles#gurami";
    };
  };
}
