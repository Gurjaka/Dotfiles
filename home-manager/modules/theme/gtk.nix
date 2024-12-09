{ config, pkgs, theme, ... }:

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
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font Medium";
      size = 12;
    };

    theme = if theme == "nord" then {
      package = pkgs.nordic;
      name = "Nordic-darker";
    }
    else if theme == "everforest" then {
      package = pkgs.everforest-gtk-theme;
      name = "Everforest-Dark-BL";
    }
    else {};

    iconTheme = if theme == "nord" then {
      package = pkgs.papirus-nord.override {
        accent = "frostblue4";
      };
      name = "Papirus-Dark";
    }
    else if theme == "everforest" then {
      package = pkgs.numix-icon-theme;
      name = "Numix";
    }
    else {};
  };
}
