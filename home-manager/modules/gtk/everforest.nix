{ config, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

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
      package = pkgs.everforest-gtk-theme;
      name = "Everforest-Dark-BL";
    };

    iconTheme = {
      package = pkgs.numix-icon-theme;
      name = "Numix";
    };
  };
}

