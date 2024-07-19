#     _     _                     _  _    _
#    / \   | |  __ _   ___  _ __ (_)| |_ | |_  _   _
#   / _ \  | | / _` | / __|| '__|| || __|| __|| | | |
#  / ___ \ | || (_| || (__ | |   | || |_ | |_ | |_| |
# /_/   \_\|_| \__,_| \___||_|   |_| \__| \__| \__, |
#                                              |___/

{
  programs.alacritty = {
    enable = true;
    settings = {
        window = {
            padding.x = 20;
            padding.y = 20;
        };
        font = {
            normal.family = "Monaspace Neon";
            bold.family = "Monaspace Neon";
            italic.family = "Monaspace Neon";
            bold_italic.family = "Monaspace Neon";
        };
        colors.primary = {
            background = "#2E3440";
            foreground = "#D8DEE9";
        };
        colors.normal = {
            black   = "#3B4252";
            red     = "#BF616A";
            green   = "#A3BE8C";
            yellow  = "#EBCB8B";
            blue    = "#81A1C1";
            magenta = "#B48EAD";
            cyan    = "#88C0D0";
            white   = "#E5E9F0";
        };
        colors.bright = {
            black   = "#4C566A";
            red     = "#BF616A";
            green   = "#A3BE8C";
            yellow  = "#EBCB8B";
            blue    = "#81A1C1";
            magenta = "#B48EAD";
            cyan    = "#8FBCBB";
            white   = "#ECEFF4";
        };
    };
  };
}