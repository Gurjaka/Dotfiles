{ theme, host, ... }:

{
  xdg.configFile."conky/conky-qtile.conf".source = ./conky-qtile-${theme}-${host}.conf;
}
