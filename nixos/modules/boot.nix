{
  pkgs,
  drivers,
  ...
}: {
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };
    # Set Xanmod kernel
    kernelPackages =
      if drivers == "amd"
      then pkgs.linuxPackages_xanmod_latest
      else pkgs.linuxPackages_zen;
  };
}
