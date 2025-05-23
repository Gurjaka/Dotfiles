{selectedTheme, ...}: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font:size=12";
        pad = "20x20";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = let
        strip = color: builtins.substring 1 6 color;
      in {
        foreground = strip selectedTheme.base05;
        background = strip selectedTheme.base01;

        selection-foreground = strip selectedTheme.base04;
        selection-background = strip selectedTheme.base03; # best match for "4c566a"

        regular0 = strip selectedTheme.base02;
        regular1 = strip selectedTheme.base11;
        regular2 = strip selectedTheme.base14;
        regular3 = strip selectedTheme.base13;
        regular4 = strip selectedTheme.base09;
        regular5 = strip selectedTheme.base15;
        regular6 = strip selectedTheme.base08;
        regular7 = strip selectedTheme.base05;

        bright0 = strip selectedTheme.base03;
        bright1 = strip selectedTheme.base11;
        bright2 = strip selectedTheme.base14;
        bright3 = strip selectedTheme.base13;
        bright4 = strip selectedTheme.base09;
        bright5 = strip selectedTheme.base15;
        bright6 = strip selectedTheme.base07;
        bright7 = strip selectedTheme.base06;

        dim0 = strip selectedTheme.base00;
        dim1 = strip selectedTheme.base11;
        dim2 = strip selectedTheme.base14;
        dim3 = strip selectedTheme.base13;
        dim4 = strip selectedTheme.base09;
        dim5 = strip selectedTheme.base15;
        dim6 = strip selectedTheme.base08;
        dim7 = strip selectedTheme.base04;
      };
    };
  };
}
