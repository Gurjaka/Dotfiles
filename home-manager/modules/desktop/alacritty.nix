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
          background = selectedTheme.colors.base01;
          foreground = selectedTheme.colors.base05;
        };

        normal = {
          black = selectedTheme.colors.base02;
          red = selectedTheme.colors.base11;
          green = selectedTheme.colors.base14;
          yellow = selectedTheme.colors.base13;
          blue = selectedTheme.colors.base09;
          magenta = selectedTheme.colors.base15;
          cyan = selectedTheme.colors.base08;
          white = selectedTheme.colors.base05;
        };

        bright = {
          black = selectedTheme.colors.base03;
          red = selectedTheme.colors.base11;
          green = selectedTheme.colors.base14;
          yellow = selectedTheme.colors.base13;
          blue = selectedTheme.colors.base09;
          magenta = selectedTheme.colors.base15;
          cyan = selectedTheme.colors.base07;
          white = selectedTheme.colors.base06;
        };
      };
    };
  };
}
