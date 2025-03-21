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
    # Set xanmod kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
}
