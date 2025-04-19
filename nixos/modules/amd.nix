{
  boot.initrd.kernelModules = ["amdgpu"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
