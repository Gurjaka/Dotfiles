{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.variant = "dvorak";
    excludePackages = [ pkgs.xterm ];
    displayManager.startx.enable = true;
  };  
}

