{ theme, ... }:

{
  programs.cava = {
    enable = false;
    settings = {
      general.framerate = 60;
      color = if theme == "nord" then {
        # foreground = "'#5E81AC'";
        gradient = 8;
        gradient_color_1 = "'#4C566A'";
        gradient_color_2 = "'#4C566A'";
        gradient_color_3 = "'#5E81AC'";
        gradient_color_4 = "'#5E81AC'";
        gradient_color_5 = "'#81A1C1'";
        gradient_color_6 = "'#81A1C1'";
        gradient_color_7 = "'#88C0D0'";
        gradient_color_8 = "'#88C0D0'";
      }
      else if theme == "everforest" then {
        # foreground = "'#5E81AC'";
        gradient = 8;
        gradient_color_1 = "'#48584E'";
        gradient_color_2 = "'#48584E'";
        gradient_color_3 = "'#A7C080'";
        gradient_color_4 = "'#A7C080'";
        gradient_color_5 = "'#83C092'";
        gradient_color_6 = "'#83C092'";
        gradient_color_7 = "'#D3C6AA'";
        gradient_color_8 = "'#D3C6AA'";
      }
      else {};
    };
  };
}
