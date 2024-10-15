{ pkgs, ... }:

{
  imports = [
    ./settings.nix
  ];
  home.packages = [
    pkgs.vesktop
  ];
  xdg.configFile."vesktop/themes/nord.css".source = ./nord.css;
  xdg.configFile."vesktop/themes/everforest.css".source = ./everforest.css;
  # xdg.configFile."vesktop/settings/settings.json".source = ./settings.json;
}
