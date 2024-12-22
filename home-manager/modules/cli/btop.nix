{ theme, ... }:

{
  programs.btop = {
    enable = true;
    settings.color_theme =
      if theme == "nord" then
        "nord"
      else if theme == "everforest" then
        "everforest-dark-hard"
      else
        { };
  };
}
