{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    # package = pkgs.kdePackages.breeze;
    # name = "Breeze_Light";
    size = 24;
  };
}
