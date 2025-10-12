{
  inputs,
  drivers,
  host,
  locale,
  pkgs,
  timezone,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/${drivers}.nix
    ./modules/boot.nix
    ./modules/console.nix
    ./modules/dwl
    ./modules/networking.nix
    ./modules/users.nix
    ./modules/xserver.nix
    ./modules/sound.nix
    ./modules/services.nix
    ./modules/programs.nix
    ./modules/portals.nix
    ./modules/polkit.nix
    ./modules/gaming.nix
    ./modules/vm.nix
  ];

  fileSystems = {
    "/".options = ["compress=zstd"];
    "/home".options = ["compress=zstd"];
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
  };

  nix = {
    # gc.automatic = true;
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
    thermald.enable =
      if host == "laptop"
      then true
      else false;
    auto-cpufreq = {
      enable =
        if host == "laptop"
        then true
        else false;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };
  };

  hardware = {
    bluetooth.enable = true;
    xpadneo.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Session
  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = 1;
      MOZ_ENABLE_WAYLAND = 1;
    };

    pathsToLink = ["/share/bash-completion"];

    # List packages installed in system profile.
    systemPackages = with pkgs; [
      inputs.agenix.packages."${system}".default
      neovim
      git
      killall
      libnotify
      man-pages
      man-pages-posix
      nix-prefetch-git
      polkit_gnome
      udiskie
    ];
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    nerd-fonts.fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    iosevka
    nerd-fonts.jetbrains-mono
    monaspace
    cascadia-code
  ];

  system.stateVersion = "24.11";
}
