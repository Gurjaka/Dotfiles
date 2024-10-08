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
          background = "#2f383e";
          foreground = "#d3c6aa";
        };
        normal = {
          black   = "#4b565c";
          red     = "#e67e80";
          green   = "#a7c080";
          yellow  = "#dbbc7f";
          blue    = "#7fbbb3";
          magenta = "#d699b6";
          cyan    = "#83c092";
          white   = "#d3c6aa";
        };
        bright = {
          black   = "#475258";
          red     = "#e67e80";
          green   = "#a7c080";
          yellow  = "#dbbc7f";
          blue    = "#7fbbb3";
          magenta = "#d699b6";
          cyan    = "#83c092";
          white   = "#d3c6aa";
        };
      };
    };
  };
}
