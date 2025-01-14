{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.variant = "dvorak";
    # Enable startx
    displayManager.startx.enable = true;
    # Enable Qtile
    windowManager.qtile = {
      enable = true;
      extraPackages = python3Packages: with python3Packages; [qtile-extras];
    };
    excludePackages = [pkgs.xterm];
  };
}
