{ pkgs, ... }:

{
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      efi.canTouchEfiVariables = true;
      # Grub
      grub = {
      	enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
    # Set linux-zen kernel
    kernelPackages = pkgs.linuxPackages_zen;
  };
}