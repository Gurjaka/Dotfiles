{
  host,
  pkgs,
  ...
}: {
  home.packages = [pkgs.conky];
  xdg.configFile."conky/conky-qtile.conf".source = ./conky-qtile-nord-${host}.conf;
}
