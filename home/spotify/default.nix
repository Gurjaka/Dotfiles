#  ____                 _    _   __
# / ___|  _ __    ___  | |_ (_) / _| _   _
# \___ \ | '_ \  / _ \ | __|| || |_ | | | |
#  ___) || |_) || (_) || |_ | ||  _|| |_| |
# |____/ | .__/  \___/  \__||_||_|   \__, |
#        |_|                         |___/

{inputs, pkgs, lib, config, spicetify-nix, ... }:

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
        text = "ECEFF4";
        subtext = "D8DEE9";
        main = "2E3440";
        main-elevated = "2E3440";
        main-transition = "2E3440";
        highlight = "2E3440";
        highlight-elevated = "2E3440";
        sidebar = "2E3440";
        player = "2E3440";
        card = "3B4252";
        shadow = "4C566A";
        selected-row = "4C566A";
        button = "5E81AC";
        button-active = "5E81AC";
        button-disabled = "434E5E";
        tab-active = "434C5E";
        notification = "5E81AC";
        notification-error = "BF616A";
        misc = "2E3440";
        play-button = "BF616A";
        play-button-active = "BF616A";
        progress-fg = "BF616A";
        progress-bg = "4C566A";
        heart = "BF616A";
        pagelink-active = "BF616A";
        radio-btn-active = "BF616A";
      };
   };
}