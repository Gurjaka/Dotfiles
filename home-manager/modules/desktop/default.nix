{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./brave.nix
    ./conky
    ./cursor.nix
    ./discord
    ./firefox.nix
    ./foot.nix
    ./gimp.nix
    ./kitty.nix
    ./librewolf.nix
    ./qtile
    ./rofi
    ./spotify.nix
    ./swaync.nix
    ./vivaldi.nix
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
    (flameshot.override {enableWlrSupport = true;})
    imv
    inputs.wezterm.packages."${system}".default
    mpv

    # Productivity
    libreoffice
    pavucontrol

    # Networking
    networkmanagerapplet
    wl-clipboard
  ];
}
