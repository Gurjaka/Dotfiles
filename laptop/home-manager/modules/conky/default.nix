{ theme, ... }:

{
  xdg.configFile."conky/conky-qtile.conf".source = ./conky-qtile-${theme}.conf;
}
