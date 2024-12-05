{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.variant = "dvorak";
    displayManager.startx.enable = true;
    excludePackages = [ pkgs.xterm ];
  };  
}

