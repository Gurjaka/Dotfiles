{ pkgs, inputs, ... } :

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];
    theme = ./nord.rasi;
    terminal = "foot";
  };
}