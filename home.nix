{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gurami";
  home.homeDirectory = "/home/gurami";

  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./home/alacritty
    ./home/rofi
    ./home/fastfetch
    ./home/git
    ./home/btop
    ./home/cava
  ];

  # Bash settings
  programs.zsh = {
    enable = true;
    shellAliases = {
      "fetch" = "fastfetch";
      "rebuild" = "sudo nixos-rebuild switch --flake ~/Dotfiles#laptop";
    };
  };

  # Starship shell
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    alacritty
    htop
    btop
    brave
    rofi-wayland
    vesktop
    vscode
    gnome.nautilus
    grim
    slurp
    wl-clipboard
    imv
    mpv
    ani-cli
    obsidian
    networkmanagerapplet
    zip
    unzip
    brightnessctl
    pavucontrol
    cava
    cmatrix
    lf
  ];

  # GTK
  gtk.enable = true;

  gtk.font.package = pkgs.fira-code;
  gtk.font.name = "Fira Code Medium";
  gtk.font.size = 11;

  gtk.cursorTheme.package = pkgs.kdePackages.breeze;
  gtk.cursorTheme.name = "Breeze_Light";

  gtk.theme.package = pkgs.nordic;
  gtk.theme.name = "Nordic";

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gurami/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
