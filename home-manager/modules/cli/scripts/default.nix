{
  pkgs,
  ...
}:

{
  home.packages =
    let
      pyflake = import ./pyflake.nix { inherit pkgs; };
      pyshell = import ./pyshell.nix { inherit pkgs; };
      c-learning = import ./c-learning.nix { inherit pkgs; };
    in
    [
      pyflake
      pyshell
      c-learning
    ];
}
