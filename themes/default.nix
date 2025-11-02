{pkgs}: {
  nord = {
    message = "Your setup is now wrapped in cool, Nordic hues.\nEmbrace clarity and focus.";
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
      package = pkgs.colloid-icon-theme;
      name = "Colloid-Dark";
    };
    nvim = {
      package = pkgs.pkgs.vimPlugins.nord-nvim;
      name = "nord";
      settings = ''
        let g:nord_contrast = v:true
        let g:nord_borders = v:false
        let g:nord_disable_background = v:false
        let g:nord_italic = v:false
        let g:nord_uniform_diff_background = v:true
        let g:nord_bold = v:false
      '';
    };
  };

  everforest = {
    message = "Your setup is now bathed in soft, earthy tones.\nEnjoy the calm and focus.";
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
    nvim = {
      package = pkgs.vimPlugins.everforest;
      name = "everforest";
      settings = ''
        let g:everforest_italic = v:false
      '';
    };
  };

  kanagawa = {
    message = "Your setup now flows with deep, oceanic blues.\nRide the waves of focus and calm.";
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
    nvim = {
      package = pkgs.vimPlugins.kanagawa-nvim;
      name = "kanagawa";
      settings = ''
      '';
    };
  };

  gruvbox = {
    message = "Warm tones of Gruvbox now color your setup.\nLet comfort and contrast guide your focus.";
    colors = {
      base00 = "#1d2021";
      base01 = "#282828";
      base02 = "#3c3836";
      base03 = "#504945";
      base04 = "#bdae93";
      base05 = "#d5c4a1";
      base06 = "#ebdbb2";
      base07 = "#fbf1c7";
      base08 = "#83a598";
      base09 = "#8ec07c";
      base10 = "#fabd2f";
      base11 = "#fe8019";
      base12 = "#fb4934";
      base13 = "#d3869b";
      base14 = "#b8bb26";
      base15 = "#d79921";
    };
    gtk = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };
    icon = {
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Plus-Dark";
    };
    nvim = {
      package = pkgs.vimPlugins.gruvbox;
      name = "gruvbox";
      settings = ''
        let g:gruvbox_contrast_dark = 'medium'
        let g:gruvbox_italic = 0
        let g:gruvbox_bold = 0
        let g:gruvbox_invert_selection = 0
      '';
    };
  };
}
