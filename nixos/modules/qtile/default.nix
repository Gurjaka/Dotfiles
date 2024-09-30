{ theme, host, ...}:

{
  services.xserver.windowManager.qtile = {
    enable = true;
    configFile = ./config.py;
    extraPackages = python3Packages: with python3Packages; [ qtile-extras ];
  };
  environment.etc."xdg/qtile/theme.py".source = ./${theme}.py; 
}
