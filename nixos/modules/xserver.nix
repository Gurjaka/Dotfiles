{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # AMD Drivers
    videoDrivers = [ "amdgpu" ];
    excludePackages = [ pkgs.xterm ];
  };
}