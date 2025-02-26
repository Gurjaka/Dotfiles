{
  inputs,
  pkgs,
  ...
}: {
  home.file = {
    ".config/wallpapers" = {
      source = inputs.nord-wallpapers.packages."${pkgs.system}".default;
      recursive = true;
    };
  };
}
