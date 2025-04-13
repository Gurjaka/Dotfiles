{pkgs, ...}: {
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };
    # Set zen kernel
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
