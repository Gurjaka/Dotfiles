{
  inputs,
  pkgs,
  selectedTheme,
  font,
  ...
}: {
  xdg.configFile."pretty/config.toml".text = ''
    [font]
    family = "${font}"
    size = 16

    [window]
    padding = 20

    [palette]
    background = "${selectedTheme.colors.base01}FF"
    color0 = "${selectedTheme.colors.base05}FF"
    color1 = "${selectedTheme.colors.base11}FF"
    color2 = "${selectedTheme.colors.base14}FF"
    color3 = "${selectedTheme.colors.base13}FF"
    color4 = "${selectedTheme.colors.base09}FF"
    color5 = "${selectedTheme.colors.base15}FF"
    color6 = "${selectedTheme.colors.base08}FF"
    color7 = "${selectedTheme.colors.base07}FF"
    color8 = "${selectedTheme.colors.base03}FF"
    color9 = "${selectedTheme.colors.base11}FF"
    color10 = "${selectedTheme.colors.base14}FF"
    color11 = "${selectedTheme.colors.base13}FF"
    color12 = "${selectedTheme.colors.base09}FF"
    color13 = "${selectedTheme.colors.base15}FF"
    color14 = "${selectedTheme.colors.base07}FF"
    color15 = "${selectedTheme.colors.base06}FF"
  '';

  # home.packages = [
  #   inputs.pretty.packages.${pkgs.stdenv.hostPlatform.system}.default
  # ];
}
