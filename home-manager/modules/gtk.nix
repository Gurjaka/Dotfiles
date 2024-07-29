{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
  
    gtk3 = {
      bookmarks = let
        home = config.home.homeDirectory;
      in [
        "file://${home}/Documents"
        "file://${home}/Dotfiles"
        "file://${home}/Downloads"
      ];
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };

    font = {
      package = pkgs.fira-code;
      name = "Fira Code Medium";
      size = 11;
    };

    cursorTheme = {
      package = pkgs.kdePackages.breeze;
      name = "Breeze_Light";
    };

    theme = {
      package = pkgs.nordic;
      name = "Nordic-darker";
    };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };
  };
}
