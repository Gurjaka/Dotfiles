{ pkgs, ... }:

{
  gtk.enable = true;

  gtk.font.package = pkgs.monaspace;
  gtk.font.name = "Fira Code Medium";
  gtk.font.size = 11;

  gtk.cursorTheme.package = pkgs.kdePackages.breeze;
  gtk.cursorTheme.name = "Breeze_Light";

  gtk.theme.package = pkgs.nordic;
  gtk.theme.name = "Nordic-darker";

  gtk.iconTheme.package = pkgs.tela-icon-theme;
  gtk.iconTheme.name = "Tela-dark";
}
