{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./conky
    ./cursor.nix
    ./firefox.nix
    ./foot.nix
    ./gimp.nix
    ./kitty.nix
    ./rofi
    ./spotify.nix
    ./swaync.nix
    ./vesktop
    ./vscode.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    # File Management
    eog
    xfce.thunar
    qbittorrent

    # Media Tools
    (flameshot.override { enableWlrSupport = true; })
    grim
    imv
    mpv
    youtube-music
    zed-editor
    wezterm
    discord-canary

    # Productivity
    libreoffice
    obsidian
    pavucontrol
    vivaldi

    # Networking
    networkmanagerapplet
    wl-clipboard
    slurp
  ];
}