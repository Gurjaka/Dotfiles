{pkgs, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFileSize = 10000;
    historyFile = "$HOME/.bash_history";
    historyControl = ["ignoredups"];
    historyIgnore = [
      "rm *"
      "pkill *"
      "cp *"
    ];
    initExtra = ''
      eval "$(starship init bash)"
      eval "$(zoxide init bash)"
    '';
    bashrcExtra = ''
      [ -f ${pkgs.fzf}/share/fzf/key-bindings.bash ] && source ${pkgs.fzf}/share/fzf/key-bindings.bash
      [ -f ${pkgs.fzf}/share/fzf/completion.bash ] && source ${pkgs.fzf}/share/fzf/completion.bash
      source <(COMPLETE=bash tms)
    '';
    shellAliases = {
      v = "nvim";
      cd = "z";
      ns = "nix-shell --command bash -p";
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
        alias | grep -E "^alias " | grep -v "alias showalias=" | while read -r line; do
          name="''${line#alias }"
          name="''${name%%=*}"
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
