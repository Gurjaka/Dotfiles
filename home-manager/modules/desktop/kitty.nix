{selectedTheme, ...}: {
  programs.kitty = {
    enable = true;
    environment = {
      "LS_COLORS" = "1";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    settings = {
      cursor_trail = 1;
      tab_bar_style = "powerline";
      tab_powerline_style = "round";

      active_tab_background = selectedTheme.base02;
      active_tab_foreground = selectedTheme.base06;
      inactive_tab_background = selectedTheme.base03;
      inactive_tab_foreground = selectedTheme.base05;

      window_padding_width = 15;
      confirm_os_window_close = 0;

      foreground = selectedTheme.base05;
      background = selectedTheme.base01;
      selection_foreground = selectedTheme.base01;
      selection_background = selectedTheme.base07;
      url_color = selectedTheme.base09;
      cursor = selectedTheme.base08;

      # black
      color0 = selectedTheme.base01;
      color8 = selectedTheme.base03;

      # red
      color1 = selectedTheme.base11;
      color9 = selectedTheme.base11;

      # green
      color2 = selectedTheme.base14;
      color10 = selectedTheme.base14;

      # yellow
      color3 = selectedTheme.base13;
      color11 = selectedTheme.base13;

      # blue
      color4 = selectedTheme.base09;
      color12 = selectedTheme.base09;

      # magenta
      color5 = selectedTheme.base15;
      color13 = selectedTheme.base15;

      # cyan
      color6 = selectedTheme.base08;
      color14 = selectedTheme.base07;

      # white
      color7 = selectedTheme.base05;
      color15 = selectedTheme.base06;
    };
  };
}
