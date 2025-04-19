{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.variant = "dvorak";
    # Enable Qtile
    windowManager.qtile = {
      enable = true;
      extraPackages = python3Packages: with python3Packages; [qtile-extras];
    };
    displayManager.startx.enable = true;
    excludePackages = [pkgs.xterm];
  };
}
