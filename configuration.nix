#  _   _  _         ___   ____
# | \ | |(_)__  __ / _ \ / ___|
# |  \| || |\ \/ /| | | |\___ \
# | |\  || | >  < | |_| | ___) |
# |_| \_||_|/_/\_\ \___/ |____/

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./home/qtile
      ./home/tuigreet
    ];

  # Boot settings
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      efi.canTouchEfiVariables = true;
      # Grub
      grub = {
      	enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
    # Set linux-zen kernel
    kernelPackages = pkgs.linuxPackages_zen;
  };

  # Maintenance
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--print-build-logs"
    ];
  };
  nix.optimise.automatic = true;
  nix.gc.automatic = true;

  # Networking settings
  networking = {
    hostName = "desktop"; # Define your hostname.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Asia/Tbilisi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # System services
  services = {
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      # AMD Drivers
      videoDrivers = [ "amdgpu" ];
      excludePackages = [ pkgs.xterm ];
    };

    # Enable sound.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Other necessary services
    udisks2.enable = true;
    gvfs.enable = true; # Mount, trash, and other functionalities (Thunar)
    tumbler.enable = true; # Thumbnail support for images (Thunar)
  };

  # Necessary programs
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    # Gaming
    steam = {
      enable = true;
      remotePlay.openFirewall = true; 
      dedicatedServer.openFirewall = true; 
      localNetworkGameTransfers.openFirewall = true; 
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;

    # Other necessary programs
    nix-ld.enable = true;
    xfconf.enable = true;
    fish.enable = true;
    dconf.enable = true;
  };

  # Enable Fish for user
  users.users.gurami.shell = pkgs.fish;

  # Xdg portals
  xdg.portal = {
   enable = true;
   config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };

  # Security settings
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Systemd services
  systemd = {
    # Polkit Gnome
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "gurami" = import ./home.nix;
    };
    sharedModules = [
      inputs.spicetify-nix.homeManagerModules.default
      inputs.nixvim.homeManagerModules.nixvim
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gurami = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
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

  # List of fonts installed in system profile.
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

