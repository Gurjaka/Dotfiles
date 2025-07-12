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
    ./nh.nix
    ./nvim
    ./lf
    ./scripts
    ./starship.nix
    ./tmux.nix
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
    ripgrep
    yt-dlp

    # Media Tools
    ani-cli
    brightnessctl
    cmatrix
    eza
    htop
    manga-cli
    ncdu
    playerctl
    swww

    # File Management
    unzip
    zip
  ];
}
