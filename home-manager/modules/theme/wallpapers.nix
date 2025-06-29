{
  inputs,
  pkgs,
  ...
}: {
  home.file = {
    ".config/wallpapers/nord/" = {
      source = inputs.nord-wallpapers.packages."${pkgs.system}".default;
      recursive = true;
    };
    ".config/wallpapers/everforest/" = {
      source = inputs.everforest-wallpapers.packages."${pkgs.system}".default;
      recursive = true;
    };
  };
}
