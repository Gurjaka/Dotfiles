{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    neovim
    git
    killall
    libnotify
    nix-prefetch-git
    polkit_gnome
    udiskie
  ];
}