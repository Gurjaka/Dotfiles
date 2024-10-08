{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware = {
    amdgpu.opencl.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
}
