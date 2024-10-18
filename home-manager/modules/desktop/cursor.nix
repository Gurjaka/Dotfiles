{ pkgs, ... }:

{
  home.pointerCursor = {
  gtk.enable = true;
  x11.enable = true;
  name = "Breeze_Light";
  package = pkgs.kdePackages.breeze;
  size = 24;
  };
}
