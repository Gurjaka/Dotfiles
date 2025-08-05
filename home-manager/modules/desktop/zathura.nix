{selectedTheme, ...}: {
  programs.zathura = {
    enable = true;
    options = {
      font = "JetBrains Mono Nerd Font Medium";
      background = "dark";
      recolor = true;
      recolor-override = true;
      recolor-lightcolor = "${selectedTheme.colors.base01}";
      recolor-darkcolor = "${selectedTheme.colors.base06}";
      default-bg = "${selectedTheme.colors.base01}";
      default-fg = "${selectedTheme.colors.base04}";
      statusbar-bg = "${selectedTheme.colors.base02}";
      statusbar-fg = "${selectedTheme.colors.base04}";
      bookmarks-bg = "${selectedTheme.colors.base03}";
      bookmarks-fg = "${selectedTheme.colors.base04}";
      popup-bg = "${selectedTheme.colors.base02}";
      popup-fg = "${selectedTheme.colors.base04}";
      link-color = "${selectedTheme.colors.base09}";
      visited-link-color = "${selectedTheme.colors.base08}";
    };
  };
}
