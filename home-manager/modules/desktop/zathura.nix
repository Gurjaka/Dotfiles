{selectedTheme, ...}: {
  programs.zathura = {
    enable = true;
    options = {
      font = "JetBrains Mono Nerd Font Medium";
      background = "dark";
      recolor = true;
      recolor-override = true;
      recolor-lightcolor = "${selectedTheme.base01}";
      recolor-darkcolor = "${selectedTheme.base06}";
      default-bg = "${selectedTheme.base01}";
      default-fg = "${selectedTheme.base04}";
      statusbar-bg = "${selectedTheme.base02}";
      statusbar-fg = "${selectedTheme.base04}";
      bookmarks-bg = "${selectedTheme.base03}"; # was #4c566a, now mapped
      bookmarks-fg = "${selectedTheme.base04}";
      popup-bg = "${selectedTheme.base02}";
      popup-fg = "${selectedTheme.base04}";
      link-color = "${selectedTheme.base09}";
      visited-link-color = "${selectedTheme.base08}";
    };
  };
}
