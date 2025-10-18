{
  pkgs,
  font,
  selectedTheme,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        font = font;
        prompt = ">> ";
        layer = "overlay";
        width = "40";
      };
      border = {
        radius = 0;
        width = 2;
      };
      dmenu = {
        exit-immediately-if-empty = "yes";
      };
      key-bindings = {
        delete-line-forward = "Control+Shift+k";
        next = "Down Control+j";
        prev = "Up Control+k";
      };
      colors = {
        background = "${selectedTheme.colors.base01}FF";
        text = "${selectedTheme.colors.base05}FF";
        selection = "${selectedTheme.colors.base09}FF";
        selection-text = "${selectedTheme.colors.base01}FF";
        border = "${selectedTheme.colors.base10}FF";
        match = "${selectedTheme.colors.base11}FF";
        selection-match = "${selectedTheme.colors.base01}FF";
        prompt = "${selectedTheme.colors.base08}FF";
      };
    };
  };
}
