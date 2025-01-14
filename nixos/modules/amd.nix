{
  boot.initrd.kernelModules = ["amdgpu"];
  hardware = {
    amdgpu = {
      amdvlk.enable = true;
      opencl.enable = false;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  services.xserver.videoDrivers = ["amdgpu"];
}
