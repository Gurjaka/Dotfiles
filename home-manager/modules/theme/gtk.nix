{
  config,
  pkgs,
  selectedTheme,
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
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font Medium";
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
}
