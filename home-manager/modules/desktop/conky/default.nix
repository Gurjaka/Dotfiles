{ theme, host, pkgs, ... }:

{
  home.packages = [
    pkgs.conky
  ];
  xdg.configFile."conky/conky-qtile.conf".source = ./conky-qtile-${theme}-${host}.conf;
}
