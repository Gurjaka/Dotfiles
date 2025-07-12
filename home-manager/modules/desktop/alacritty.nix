{selectedTheme, ...}: {
  programs.alacritty = {
    enable = false;

    settings = {
      env.TERM = "xterm-256color";

      window.padding = {
        x = 20;
        y = 20;
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
          style = "Bold Italic";
        };
      };

      colors = {
        primary = {
          background = selectedTheme.base01;
          foreground = selectedTheme.base05;
        };

        normal = {
          black = selectedTheme.base02;
          red = selectedTheme.base11;
          green = selectedTheme.base14;
          yellow = selectedTheme.base13;
          blue = selectedTheme.base09;
          magenta = selectedTheme.base15;
          cyan = selectedTheme.base08;
          white = selectedTheme.base05;
        };

        bright = {
          black = selectedTheme.base03;
          red = selectedTheme.base11;
          green = selectedTheme.base14;
          yellow = selectedTheme.base13;
          blue = selectedTheme.base09;
          magenta = selectedTheme.base15;
          cyan = selectedTheme.base07;
          white = selectedTheme.base06;
        };
      };
    };
  };
}
