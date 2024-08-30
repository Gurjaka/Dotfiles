{ pkgs, ... }:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      # Grub
      # grub = {
      # 	enable = true;
      #   device = "nodev";
      #   efiSupport = true;
      # };
    };
    # Set linux-zen kernel
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
