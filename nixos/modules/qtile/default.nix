{ inputs, pkgs, ...}:

{
  services.xserver.windowManager.qtile = {
    enable = true;
    package = pkgs.qtile.overrideAttrs { version = inputs.qtile.shortRev; src = inputs.qtile.outPath; };
    configFile = ./config.py;
    extraPackages = python3Packages: with python3Packages; [ qtile-extras ];
  }; 
}
