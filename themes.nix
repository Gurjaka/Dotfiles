{pkgs}: {
  nord = {
    colors = {
      base00 = "#242933";
      base01 = "#2e3440";
      base02 = "#3b4252";
      base03 = "#434c5e";
      base04 = "#d8dee9";
      base05 = "#e5e9f0";
      base06 = "#eceff4";
      base07 = "#8fbcbb";
      base08 = "#88c0d0";
      base09 = "#81a1c1";
      base10 = "#5e81ac";
      base11 = "#bf616a";
      base12 = "#d08770";
      base13 = "#ebcb8b";
      base14 = "#a3be8c";
      base15 = "#b48ead";
    };
    gtk = {
      package = pkgs.nordic;
      name = "Nordic-darker";
    };
    icon = {
      package = pkgs.papirus-nord.override {accent = "frostblue4";};
      name = "Papirus-Dark";
    };
  };

  everforest = {
    colors = {
      base00 = "#272E33";
      base01 = "#2d353b";
      base02 = "#374247";
      base03 = "#4a555b";
      base04 = "#9da9a0";
      base05 = "#d3c6aa";
      base06 = "#fdf6e3";
      base07 = "#7fbbb3";
      base08 = "#83c092";
      base09 = "#a7c080";
      base10 = "#e69875";
      base11 = "#e67e80";
      base12 = "#dbbc7f";
      base13 = "#e69875";
      base14 = "#a7c080";
      base15 = "#d699b6";
    };
    gtk = {
      package = pkgs.everforest-gtk-theme;
      name = "Everforest-Dark-BL";
    };
    icon = {
      package = pkgs.numix-icon-theme;
      name = "Numix";
    };
  };

  kanagawa = {
    colors = {
      base00 = "#2a2a37";
      base01 = "#1f1f28";
      base02 = "#44475a";
      base03 = "#585b70";
      base04 = "#dcd7ba";
      base05 = "#dcd7ba";
      base06 = "#e8e1cf";
      base07 = "#c8d3f5";
      base08 = "#c34043";
      base09 = "#ff7a93";
      base10 = "#ffa066";
      base11 = "#ffad66";
      base12 = "#f2d064";
      base13 = "#91c6b9";
      base14 = "#8fbfdc";
      base15 = "#c6c8dc";
    };
    gtk = {
      package = pkgs.kanagawa-gtk-theme;
      name = "Kanagawa-BL";
    };
    icon = {
      package = pkgs.kanagawa-icon-theme;
      name = "Kanagawa";
    };
  };
}
