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
    ./modules/gimp.nix
    ./modules/mangohud.nix
    ./modules/ranger.nix
    ./modules/rofi
    ./modules/conky
    ./modules/vesktop
  ];

  # Session
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Pkgs
  nixpkgs.config.allowUnfree = true;

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
    mangohud
    conky
    youtube-music
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
