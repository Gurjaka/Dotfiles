{
  inputs,
  pkgs,
  ...
}: {
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      autoSkipVideo
      hidePodcasts
      shuffle
      fullScreen
      volumePercentage
    ];
    theme = spicePkgs.themes.comfy;
    colorScheme = "Nord";
  };
}
