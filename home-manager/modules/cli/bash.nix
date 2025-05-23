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
      [ -f ${pkgs.fzf}/share/fzf/key-bindings.bash ] && source ${pkgs.fzf}/share/fzf/key-bindings.bash
      [ -f ${pkgs.fzf}/share/fzf/completion.bash ] && source ${pkgs.fzf}/share/fzf/completion.bash
    '';

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
