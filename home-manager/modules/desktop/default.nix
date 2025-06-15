{pkgs, ...}: {
  imports = [
    # ./yt-music
    ./alacritty.nix
    ./brave.nix
    ./conky
    ./cursor.nix
    ./discord
    ./firefox.nix
    ./flameshot.nix
    ./foot.nix
    ./gimp.nix
    ./kitty.nix
    ./librewolf.nix
    ./mangohud.nix
    ./qtile
    ./rofi
    ./spotify.nix
    ./sway.nix
    ./swaync.nix
    ./vivaldi
    ./vscode.nix
    ./wofi.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    # File Management
    eog
    qbittorrent
    xfce.thunar

    # Media Tools
    imv
    mpv
    wl-color-picker

    # Productivity
    libreoffice
    pavucontrol

    # Networking
    networkmanagerapplet
    wl-clipboard
  ];
}
