{
  config,
  pkgs,
  themes,
  selectedTheme,
  font,
  ...
}: let
in {
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
      name = font;
      size = 12;
    };

    theme = {
      package = selectedTheme.gtk.package;
      name = selectedTheme.gtk.name;
    };

    iconTheme = {
      package = selectedTheme.icon.package;
      name = selectedTheme.icon.name;
    };
  };

  home.packages =
    builtins.map (theme: theme.gtk.package) (builtins.attrValues themes)
    ++ builtins.map (theme: theme.icon.package) (builtins.attrValues themes);
}
