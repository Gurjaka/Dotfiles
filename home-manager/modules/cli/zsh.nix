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
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
      }
    ];
    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
    '';
    shellAliases = {
      v = "nvim";
      cd = "z";
      ns = "nix-shell --command zsh -p";
      ls = "eza --icons";
      fetch = "fastfetch";
      os = "nh os switch ~/Dotfiles";
      update = "nix flake update --flake ~/Dotfiles";
      garbage = "nh clean all";
      ufda = "echo 'use flake' | tee .envrc && direnv allow";
      za = "zathura";
      md = "mkdir";
      hs = "nh home switch ~/Dotfiles";
      showalias = ''
        echo -e "\n\033[1;34m───────────[ Your Aliases ]───────────\033[0m\n"
        alias | grep -E "^[a-zA-Z_][a-zA-Z0-9_-]*=" | grep -v "^showalias=" | while IFS= read -r line; do
          name="''${line%%=*}"
          value="''${line#*=}"
          value="''${value#\'}"
          value="''${value%\'}"
          printf " \033[1;36m%-20s\033[0m → \033[0;37m%s\033[0m\n" "$name" "$value"
        done | sort
        echo -e "\n\033[1;34m──────────────────────────────────────\033[0m\n"
      '';
    };
  };
}
