#  _   _                           __  __
# | | | |  ___   _ __ ___    ___  |  \/  |  __ _  _ __    __ _   __ _   ___  _ __
# | |_| | / _ \ | '_ ` _ \  / _ \ | |\/| | / _` || '_ \  / _` | / _` | / _ \| '__|
# |  _  || (_) || | | | | ||  __/ | |  | || (_| || | | || (_| || (_| ||  __/| |
# |_| |_| \___/ |_| |_| |_| \___| |_|  |_| \__,_||_| |_| \__,_| \__, | \___||_|
#                                                               |___/

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
    ./modules/fish.nix
    ./modules/starship.nix
    ./modules/gtk.nix
    ./modules/qt.nix
    ./modules/kitty.nix
    ./modules/neovim.nix
    ./modules/tmux.nix
    ./modules/direnv.nix
    ./modules/swaync.nix
    ./modules/spotify.nix
    ./modules/fastfetch.nix
    ./modules/git.nix
    ./modules/btop.nix
    ./modules/cava.nix
    ./modules/rofi
    ./modules/conky
    ./modules/vesktop
  ];

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    kitty
    ripgrep
    htop
    btop
    xfce.thunar
    brave
    firefox
    vesktop
    vscode
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
    ranger
    libreoffice-fresh
    gimp
    eog
    android-tools
    steam
    steam-run
    mangohud
    zed-editor
    conky
    feh
    youtube-music
  ];

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
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
