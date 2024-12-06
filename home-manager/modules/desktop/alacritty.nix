{ theme, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      window = {
        padding = {
          x = 20;
          y = 20;
        };
      };
      font = {
        size = 12;
        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "Medium";
        };
        bold = {
          family = "JetBrains Mono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrains Mono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrains Mono Nerd Font";
          style = "Bold italic";
        };
      };
      colors = if theme == "nord" then {
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
      }
      else if theme == "everforest" then {
        primary = {
          background = "#2b3339";
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
      }
      else {};
    };
  };
}

