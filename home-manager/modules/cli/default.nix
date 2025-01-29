{pkgs, ...}: {
  imports = [
    ./btop.nix
    ./cava.nix
    ./direnv.nix
    ./fastfetch.nix
    ./fish.nix
    ./git.nix
    ./nvim
    ./ranger.nix
    ./starship.nix
    ./tmux.nix
    ./scripts
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    # Development Tools
    android-tools
    alejandra
    black
    fzf
    gcc
    lazygit
    live-server
    ripgrep
    waypipe
    yt-dlp

    # Media Tools
    ani-cli
    brightnessctl
    cmatrix
    eza
    htop
    manga-cli
    nh
    playerctl

    # File Management
    unzip
    zip

    # Other
    ollama
  ];
}
