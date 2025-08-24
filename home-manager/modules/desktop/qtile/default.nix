{
  colorscheme,
  selectedTheme,
  font,
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
      		"font": "${font}",
      		"theme": "${colorscheme}",
      		"base00": "${selectedTheme.colors.base00}",
      		"base01": "${selectedTheme.colors.base01}",
      		"base02": "${selectedTheme.colors.base02}",
      		"base03": "${selectedTheme.colors.base03}",
      		"base04": "${selectedTheme.colors.base04}",
      		"base05": "${selectedTheme.colors.base05}",
      		"base06": "${selectedTheme.colors.base06}",
      		"base07": "${selectedTheme.colors.base07}",
      		"base08": "${selectedTheme.colors.base08}",
      		"base09": "${selectedTheme.colors.base09}",
      		"base10": "${selectedTheme.colors.base10}",
      		"base11": "${selectedTheme.colors.base11}",
      		"base12": "${selectedTheme.colors.base12}",
      		"base13": "${selectedTheme.colors.base13}",
      		"base14": "${selectedTheme.colors.base14}",
      		"base15": "${selectedTheme.colors.base15}",
      }
    '';
    target = ".config/qtile/theme.py";
  };
}
