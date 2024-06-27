#  ____   _
# | __ ) | |_   ___   _ __
# |  _ \ | __| / _ \ | '_ \
# | |_) || |_ | (_) || |_) |
# |____/  \__| \___/ | .__/
#                    |_|

{ pkgs, ...} :

{
  programs.btop = {
    enable = true;
    settings = {
        color_theme = "nord";
    };
  };
}