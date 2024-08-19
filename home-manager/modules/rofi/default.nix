{ pkgs, theme, ... } :

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; 
    theme = ./${theme}.rasi;
    terminal = "kitty";
  };
}
