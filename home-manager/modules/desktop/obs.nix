{pkgs, ...}: {
  programs.obs-studio = {
    enable = false;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      droidcam-obs
    ];
  };
}
