{ pkgs, theme, host, ... } :

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; 
    theme = ./${theme}-${host}.rasi;
    terminal = "kitty";
  };
}
