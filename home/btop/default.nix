{ pkgs, ...} :
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = {
        color-theme = "nord";
        theme_background = true;
    };
  };
}