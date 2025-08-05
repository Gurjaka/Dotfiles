{selectedTheme, ...}: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrains Mono Nerd Font:size=12, monospace:size=12";
        pad = "20x20";
        dpi-aware = "no";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = let
        strip = color: builtins.substring 1 6 color;
      in {
        foreground = strip selectedTheme.colors.base05;
        background = strip selectedTheme.colors.base01;

        selection-foreground = strip selectedTheme.colors.base04;
        selection-background = strip selectedTheme.colors.base03; # best match for "4c566a"

        regular0 = strip selectedTheme.colors.base02;
        regular1 = strip selectedTheme.colors.base11;
        regular2 = strip selectedTheme.colors.base14;
        regular3 = strip selectedTheme.colors.base13;
        regular4 = strip selectedTheme.colors.base09;
        regular5 = strip selectedTheme.colors.base15;
        regular6 = strip selectedTheme.colors.base08;
        regular7 = strip selectedTheme.colors.base05;

        bright0 = strip selectedTheme.colors.base03;
        bright1 = strip selectedTheme.colors.base11;
        bright2 = strip selectedTheme.colors.base14;
        bright3 = strip selectedTheme.colors.base13;
        bright4 = strip selectedTheme.colors.base09;
        bright5 = strip selectedTheme.colors.base15;
        bright6 = strip selectedTheme.colors.base07;
        bright7 = strip selectedTheme.colors.base06;

        dim0 = strip selectedTheme.colors.base00;
        dim1 = strip selectedTheme.colors.base11;
        dim2 = strip selectedTheme.colors.base14;
        dim3 = strip selectedTheme.colors.base13;
        dim4 = strip selectedTheme.colors.base09;
        dim5 = strip selectedTheme.colors.base15;
        dim6 = strip selectedTheme.colors.base08;
        dim7 = strip selectedTheme.colors.base04;
      };
    };
  };
}
