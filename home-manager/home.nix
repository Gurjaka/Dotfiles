{ pkgs, user, theme, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./modules/fish.nix
    ./modules/starship.nix
    ./modules/themes/${theme}/gtk.nix
    ./modules/qt.nix
    ./modules/themes/${theme}/kitty.nix
    ./modules/neovim.nix
    ./modules/tmux.nix
    ./modules/zoxide.nix
    ./modules/direnv.nix
    ./modules/vscode.nix
    ./modules/themes/${theme}/swaync.nix
    ./modules/themes/${theme}/spotify.nix
    ./modules/fastfetch.nix
    ./modules/git.nix
    ./modules/themes/${theme}/btop.nix
    ./modules/themes/${theme}/cava.nix
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
    vivaldi
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
    fzf
    zoxide
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
