{
  colorscheme,
  selectedTheme,
  ...
}: {
  home.file.qtile_configs = {
    source = ./src;
    target = ".config/qtile";
    recursive = true;
  };
  home.file.theme = {
    text = ''
      colors = {
          "theme": "${colorscheme}",
          "base00": "${selectedTheme.base00}",
          "base01": "${selectedTheme.base01}",
          "base02": "${selectedTheme.base02}",
          "base03": "${selectedTheme.base03}",
          "base04": "${selectedTheme.base04}",
          "base05": "${selectedTheme.base05}",
          "base06": "${selectedTheme.base06}",
          "base07": "${selectedTheme.base07}",
          "base08": "${selectedTheme.base08}",
          "base09": "${selectedTheme.base09}",
          "base10": "${selectedTheme.base10}",
          "base11": "${selectedTheme.base11}",
          "base12": "${selectedTheme.base12}",
          "base13": "${selectedTheme.base13}",
          "base14": "${selectedTheme.base14}",
          "base15": "${selectedTheme.base15}",
      }
    '';
    target = ".config/qtile/theme.py";
  };
}
