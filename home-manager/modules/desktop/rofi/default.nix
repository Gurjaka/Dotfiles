{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./nord.rasi;
    terminal = "footclient";
  };
}
