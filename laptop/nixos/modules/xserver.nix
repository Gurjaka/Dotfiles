{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    # videoDrivers = [ "amdgpu" ];
    enable = true;
    excludePackages = [ pkgs.xterm ];
  };
}
