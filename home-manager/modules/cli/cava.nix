{selectedTheme, ...}: {
  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 60;
      color = {
        gradient = 8;
        gradient_color_1 = "'${selectedTheme.base03}'";
        gradient_color_2 = "'${selectedTheme.base03}'";
        gradient_color_3 = "'${selectedTheme.base10}'";
        gradient_color_4 = "'${selectedTheme.base10}'";
        gradient_color_5 = "'${selectedTheme.base09}'";
        gradient_color_6 = "'${selectedTheme.base09}'";
        gradient_color_7 = "'${selectedTheme.base08}'";
        gradient_color_8 = "'${selectedTheme.base08}'";
      };
    };
  };
}
