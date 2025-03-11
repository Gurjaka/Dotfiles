{
  programs.kitty = {
    enable = true;
    environment = {
      "LS_COLORS" = "1";
    };
    font = {
      name = "JetBrains Mono Nerd Font";
      size = 12;
    };
    settings = {
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      active_tab_background = "#3b4252";
      active_tab_foreground = "#ECEFF4";
      inactive_tab_background = "#4c566a";
      inactive_tab_foreground = "#D8DEE9";

      window_padding_width = 15;
      confirm_os_window_close = 0;

      foreground = "#D8DEE9";
      background = "#2E3440";
      selection_foreground = "#000000";
      selection_background = "#FFFACD";
      url_color = "#0087BD";
      cursor = "#81A1C1";

      # black
      color0 = "#3B4252";
      color8 = "#4C566A";

      # red
      color1 = "#BF616A";
      color9 = "#BF616A";

      # green
      color2 = "#A3BE8C";
      color10 = "#A3BE8C";

      # yellow
      color3 = "#EBCB8B";
      color11 = "#EBCB8B";

      # blue
      color4 = "#81A1C1";
      color12 = "#81A1C1";

      # magenta
      color5 = "#B48EAD";
      color13 = "#B48EAD";

      # cyan
      color6 = "#88C0D0";
      color14 = "#8FBCBB";

      # white
      color7 = "#E5E9F0";
      color15 = "#ECEFF4";
    };
  };
}
