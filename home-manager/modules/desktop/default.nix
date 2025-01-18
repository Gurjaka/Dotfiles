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
    ./firefox.nix
    ./foot.nix
    ./gimp.nix
    ./kitty.nix
    ./qtile
    ./rofi
    ./spotify.nix
    ./swaync.nix
    ./vesktop
    ./vivaldi.nix
    ./vscode.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    # File Management
    eog
    qbittorrent
    xfce.thunar

    # Media Tools
    (flameshot.override {enableWlrSupport = true;})
    discord-canary
    grim
    imv
    inputs.zen-browser.packages."${system}".default
    inputs.wezterm.packages."${system}".default
    mpv
    youtube-music
    zed-editor

    # Productivity
    libreoffice
    obsidian
    pavucontrol

    # Networking
    networkmanagerapplet
    slurp
    wl-clipboard
  ];
}
