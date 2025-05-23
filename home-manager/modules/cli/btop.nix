{
  pkgs,
  drivers,
  colorscheme,
  ...
}: {
  programs.btop = {
    enable = true;
    package =
      if drivers == "amd"
      then pkgs.btop-rocm
      else if drivers == "nvidia"
      then pkgs.btop-cuda
      else pkgs.btop;
    settings.color_theme =
      if colorscheme == "nord"
      then "nord"
      else if colorscheme == "everforest"
      then "everforest-dark-medium"
      else {};
  };
}
