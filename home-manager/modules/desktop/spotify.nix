{
  inputs,
  pkgs,
  colorscheme,
  ...
}: {
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = false;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      autoSkipVideo
      hidePodcasts
      shuffle
      fullScreen
      volumePercentage
    ];
    theme = spicePkgs.themes.comfy;
    colorScheme =
      if colorscheme == "nord"
      then "Nord"
      else if colorscheme == "everforest"
      then "Everforest"
      else {};
  };
}
