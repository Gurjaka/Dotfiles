{ pkgs, timezone, locale, ... }:

{
  imports = [
    ./modules/boot.nix
    ./modules/maintenance.nix
    ./modules/console.nix
    ./modules/networking.nix
    ./modules/users.nix
    ./modules/xserver.nix
    ./modules/tuigreet.nix
    ./modules/sound.nix
    ./modules/services.nix
    ./modules/programs.nix
    ./modules/portals.nix
    ./modules/polkit.nix
    ./modules/fonts.nix
    ./modules/gaming.nix
    ./modules/qtile
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "${timezone}";

  # Select internationalisation properties.
  i18n.defaultLocale = "${locale}";

  # Security settings
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Session
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

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

  system.stateVersion = "24.05";
}

