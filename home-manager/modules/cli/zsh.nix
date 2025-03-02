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
    };

    oh-my-zsh = {
      enable = true;
      # custom = "$HOME/.extra/zsh";
      # theme = "theme";

      plugins = [
        "git"
        "ssh-agent"
      ];
    };
  };
  home.file.omz_zsh_theme = {
    text = ''
      ZSH_THEME_GIT_PROMPT_PREFIX=" - %F{blue}[%F{red}"
      ZSH_THEME_GIT_PROMPT_SUFFIX="%F{blue}]%f"
      ZSH_THEME_GIT_PROMPT_DIRTY=" %F{green}+"
      ZSH_THEME_GIT_PROMPT_CLEAN=""

      local pwd="%F{blue}[%f%F{grey}%~%F{blue}]%f"
      local user="%F{blue}[%F{green}%n%f@%F{cyan}%m%F{blue}]%f"
      local count="%F{blue}[%b%F{yellow}%!%F{blue}%B]%f"
      local decoration="%F{magenta}$%F{blue}"

      local sep="%b-%B"
      PROMPT=$'%B%F{blue}┌─$user $sep $pwd$(git_prompt_info) $sep $count%B%F{blue}\n└─[$decoration]%f '
      RPROMPT="[%*]"
      PS2="%F{magenta}>%f "
      PS3="%F{magenta}>%f "
    '';
    target = ".extra/zsh/theme.zsh-theme";
  };
}
