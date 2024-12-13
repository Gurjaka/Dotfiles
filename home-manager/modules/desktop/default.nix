{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./brave.nix
    ./conky
    ./cursor.nix
    ./firefox.nix
    ./foot.nix
    ./gimp.nix
    ./kitty.nix
    ./rofi
    ./spotify.nix
    ./swaync.nix
    ./vivaldi.nix
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

    # Networking
    networkmanagerapplet
    wl-clipboard
    slurp
  ];
}
