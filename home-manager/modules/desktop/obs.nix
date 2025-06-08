{
  pkgs,
  host,
  ...
}: {
  programs.obs-studio = {
    enable =
      if host == "desktop"
      then true
      else false;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      droidcam-obs
    ];
  };
}
