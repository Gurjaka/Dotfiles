{
  programs.kitty = {
    enable = true;
    font.name = "fira code medium";
    font.size = 11;
    settings = {
      window_padding_width = 10;

      confirm_os_window_close = 0;

      foreground = "#d3c6aa";
      background = "#2b3339";
      selection_foreground = "#9da9a0";
      selection_background = "#503946";

      cursor = "#d3c6aa";
      cursor_text_color = "#323c41";

      url_color = "#7fbbb3";

      active_border_color = "#a7c080";
      inactive_border_color = "#53605c";
      bell_border_color = "#e69875";
      visual_bell_color = "none";

      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      active_tab_background = "#2b3339";
      active_tab_foreground = "#d3c6aa";
      inactive_tab_background = "#3a454a";
      inactive_tab_foreground = "#9da9a0";
      tab_bar_background = "#323c41";
      tab_bar_margin_color = "none";

      mark1_foreground = "#2b3339";
      mark1_background = "#7fbbb3";
      mark2_foreground = "#2b3339";
      mark2_background = "#d3c6aa";
      mark3_foreground = "#2b3339";
      mark3_background = "#d699b6";

      #: black
      color0 = "#374247";
      color8 = "#404c51";

      #: red
      color1 = "#e67e80";
      color9 = "#e67e80";

      #: green
      color2 = "#a7c080";
      color10 = "#a7c080";

      #: yellow
      color3 = "#dbbc7f";
      color11 = "#dbbc7f";

      #: blue
      color4 = "#7fbbb3";
      color12 = "#7fbbb3";

      #: magenta
      color5 = "#d699b6";
      color13 = "#d699b6";

      #: cyan
      color6 = "#83c092";
      color14 = "#83c092";

      #: white
      color7 = "#859289";
      color15 = "#9da9a0";    
    };
  };
}

