{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.amdgpu.opencl.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
}
