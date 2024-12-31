{
  pkgs,
  host,
  ...
}:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./nord-${host}.rasi;
    terminal = "kitty";
  };
}
