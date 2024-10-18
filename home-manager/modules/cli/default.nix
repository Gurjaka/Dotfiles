{ pkgs, ... }:

{
  imports = [
    ./btop.nix
    ./cava.nix
    ./direnv.nix
    ./fastfetch.nix
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./ranger.nix
    ./starship.nix
    ./tmux.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    # Development Tools 
    android-tools 
    fzf 
    gcc
    lazygit
    live-server
    ripgrep
    yt-dlp

    # Media Tools
    ani-cli
    brightnessctl
    cmatrix
    eza
    htop
    manga-cli
    playerctl
    
    # File Management
    unzip
    zip

    # Other
    ollama
  ];
}
