{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.amdgpu.opencl.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
}
