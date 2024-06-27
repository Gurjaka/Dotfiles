#  ____   _
# |  _ \ (_) _ __   ___  _ __  __   __
# | | | || || '__| / _ \| '_ \ \ \ / /
# | |_| || || |   |  __/| | | | \ V /
# |____/ |_||_|    \___||_| |_|  \_/

{pkgs, config, inputs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}