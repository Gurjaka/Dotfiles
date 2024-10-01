{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 20;
          y = 20;
        };
      };
      font = {
        normal = {
          family = "Fira Code";
          style = "Medium";
        };
        bold = {
          family = "Fira Code";
          style = "Bold";
        };
        italic = {
          family = "Fira Code";
          style = "Italic";
        };
        bold_italic = {
          family = "Fira Code";
          style = "Bold italic";
        };
      };
      colors = {
        primary = {
          background = "#2E3440";
          foreground = "#D8DEE9";
        };
        normal = {
          black   = "#3B4252";
          red     = "#BF616A";
          green   = "#A3BE8C";
          yellow  = "#EBCB8B";
          blue    = "#81A1C1";
          magenta = "#B48EAD";
          cyan    = "#88C0D0";
          white   = "#E5E9F0";
        };
        bright = {
          black   = "#4C566A";
          red     = "#BF616A";
          green   = "#A3BE8C";
          yellow  = "#EBCB8B";
          blue    = "#81A1C1";
          magenta = "#B48EAD";
          cyan    = "#8FBCBB";
          white   = "#ECEFF4";
        };
      };
    };
  };
}
