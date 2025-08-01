{pkgs, ...}: {
  imports = [
    ./bat.nix
    ./bash.nix
    ./btop.nix
    ./cava.nix
    ./direnv.nix
    ./focus-mode.nix
    ./fastfetch.nix
    ./fish.nix
    ./git.nix
    ./mime.nix
    ./mpd.nix
    ./nh.nix
    ./nvim
    ./lf
    ./scripts
    ./starship.nix
    ./rmpc.nix
    ./tmux.nix
    ./tms.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    # Development Tools
    android-tools
    alejandra
    fzf
    gcc
    lazygit
    ruff
    ripgrep
    yt-dlp

    # Media Tools
    ani-cli
    brightnessctl
    cmatrix
    eza
    htop
    manga-cli
    mpc
    ncdu
    playerctl
    swww

    # File Management
    unzip
    zip
  ];
}
