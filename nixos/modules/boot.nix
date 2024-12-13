{ pkgs, ... }:

{
  boot = {
    tmp.cleanOnBoot = true;
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
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
}
