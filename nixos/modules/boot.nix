{pkgs, ...}: {
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    # Set xanmod kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
}
