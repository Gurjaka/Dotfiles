{pkgs, ...}: {
  imports = [./settings.nix];
  home.packages = [pkgs.vesktop];
  xdg.configFile."vesktop/themes/nord.css".source = ./nord.css;
}
