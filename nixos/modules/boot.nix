{ lib, pkgs, ... }:

{
  boot = {
    tmp.cleanOnBoot = true;
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = lib.mkForce false;
    };
    # Set linux-zen kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
  environment.systemPackages = [
    pkgs.sbctl
  ];
}
