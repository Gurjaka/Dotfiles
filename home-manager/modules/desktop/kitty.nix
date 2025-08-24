{
  selectedTheme,
  font,
  ...
}: {
  programs.kitty = {
    enable = false;
    environment = {
      "LS_COLORS" = "1";
    };
    font = {
      name = font;
      size = 12;
    };
    settings = {
      text_composition_strategy = "legacy";
      cursor_trail = 1;
      tab_bar_style = "powerline";
      tab_powerline_style = "round";

      active_tab_background = selectedTheme.colors.base02;
      active_tab_foreground = selectedTheme.colors.base06;
      inactive_tab_background = selectedTheme.colors.base03;
      inactive_tab_foreground = selectedTheme.colors.base05;

      window_padding_width = 15;
      confirm_os_window_close = 0;

      foreground = selectedTheme.colors.base05;
      background = selectedTheme.colors.base01;
      selection_foreground = selectedTheme.colors.base01;
      selection_background = selectedTheme.colors.base07;
      url_color = selectedTheme.colors.base09;
      cursor = selectedTheme.colors.base08;

      # black
      color0 = selectedTheme.colors.base01;
      color8 = selectedTheme.colors.base03;

      # red
      color1 = selectedTheme.colors.base11;
      color9 = selectedTheme.colors.base11;

      # green
      color2 = selectedTheme.colors.base14;
      color10 = selectedTheme.colors.base14;

      # yellow
      color3 = selectedTheme.colors.base13;
      color11 = selectedTheme.colors.base13;

      # blue
      color4 = selectedTheme.colors.base09;
      color12 = selectedTheme.colors.base09;

      # magenta
      color5 = selectedTheme.colors.base15;
      color13 = selectedTheme.colors.base15;

      # cyan
      color6 = selectedTheme.colors.base08;
      color14 = selectedTheme.colors.base07;

      # white
      color7 = selectedTheme.colors.base05;
      color15 = selectedTheme.colors.base06;
    };
  };
}
