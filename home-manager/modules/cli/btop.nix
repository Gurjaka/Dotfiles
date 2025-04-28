{
  pkgs,
  drivers,
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
    settings.color_theme = "nord";
  };
}
