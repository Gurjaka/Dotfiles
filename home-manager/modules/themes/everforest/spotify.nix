{inputs, pkgs, ... }:

{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle 
        fullScreen
        volumePercentage
      ];
      theme = spicePkgs.themes.bloom;
      colorScheme = "custom";
      customColorScheme = {
        text = "9DA9AO";
        subtext = "859289";
        main = "2D353B";
        main-elevated = "2D353B";
        main-transition = "2D353B";
        highlight = "2D353B";
        highlight-elevated = "2D353B";
        sidebar = "2D353B";
        player = "2D353B";
        card = "343F44";
        shadow = "3D484D";
        selected-row = "3D484D";
        button = "3A515D";
        button-active = "3A515D";
        button-disabled = "434E5E";
        tab-active = "3D484D";
        notification = "3A515D";
        notification-error = "E67E80";
        misc = "2D353B";
        play-button = "E67E80";
        play-button-active = "E67E80";
        progress-fg = "E67E80";
        progress-bg = "475258";
        heart = "E67E80";
        pagelink-active = "E67E80";
        radio-btn-active = "E67E80";
      };
   };
}

