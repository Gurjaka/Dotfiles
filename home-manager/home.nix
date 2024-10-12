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
    ./modules/zsh.nix
    ./modules/fish.nix
    ./modules/starship.nix
    ./modules/gtk.nix
    ./modules/qt.nix
    ./modules/foot.nix
    ./modules/kitty.nix
    ./modules/alacritty.nix
    ./modules/neovim.nix
    ./modules/tmux.nix
    ./modules/zoxide.nix
    ./modules/yazi.nix
    ./modules/direnv.nix
    ./modules/firefox.nix
    ./modules/vscode.nix
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
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

  # Pkgs
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Terminal 
    kitty
    foot

    # CLI
    ripgrep
    htop
    btop
    cava
    cmatrix
    brightnessctl
    ani-cli
    manga-cli 
    zip
    unzip
    ollama
    eza
    wakatime

    # File Manager
    xfce.thunar
    ranger
    yazi

    # Browser
    # brave
    # firefox
    vivaldi

    # Communication
    vesktop

    # Development
    vscode
    fzf    
    zoxide
    obsidian
    gimp
    lazygit
    gcc

    # Useful utillities
    grim
    slurp
    wl-clipboard
    flameshot
    imv
    mpv
    conky
    networkmanagerapplet
    pavucontrol
    libreoffice-fresh
    eog
    android-tools
    youtube-music
    qbittorrent
    yt-dlp
    playerctl

    # Gaming
    lutris
    mangohud
    protonup
  ];
  home.sessionVariables = {

  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
