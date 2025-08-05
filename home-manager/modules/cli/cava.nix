{selectedTheme, ...}: {
  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 60;
      color = {
        gradient = 8;
        gradient_color_1 = "'${selectedTheme.colors.base03}'";
        gradient_color_2 = "'${selectedTheme.colors.base03}'";
        gradient_color_3 = "'${selectedTheme.colors.base10}'";
        gradient_color_4 = "'${selectedTheme.colors.base10}'";
        gradient_color_5 = "'${selectedTheme.colors.base09}'";
        gradient_color_6 = "'${selectedTheme.colors.base09}'";
        gradient_color_7 = "'${selectedTheme.colors.base08}'";
        gradient_color_8 = "'${selectedTheme.colors.base08}'";
      };
    };
  };
}
