{
  pkgs,
  drivers,
  timezone,
  locale,
  host,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/${drivers}.nix
    ./modules/boot.nix
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
    ./modules/gaming.nix
    ./modules/qtile
  ];

  nix = {
    gc.automatic = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
      auto-optimise-store = true;
    };
  };

  # Set your time zone.
  time.timeZone = "${timezone}";

  # Select internationalisation properties.
  i18n.defaultLocale = "${locale}";

  # Security settings
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Laptop battery settings
  services = {
    thermald.enable = if host == "laptop" then true else false;
    tlp = {
      enable = if host == "laptop" then true else false;
      settings = {
        TLP_DEFAULT_MODE = "BAT";
        TLP_PERSISTENT_DEFAULT = 1;
      };
    };
  };

  # Session
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = [
    pkgs.neovim
    pkgs.git
    pkgs.killall
    pkgs.libnotify
    pkgs.man-pages
    pkgs.man-pages-posix
    pkgs.nix-prefetch-git
    pkgs.polkit_gnome
    pkgs.udiskie
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    iosevka
    jetbrains-mono
    nerdfonts
    monaspace
    cascadia-code
  ];

  system.stateVersion = "24.05";
}
