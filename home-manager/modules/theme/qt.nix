{ pkgs, ... }:

{
  qt.enable = true;
  qt.platformTheme.name = "gtk";

  qt.style.package = pkgs.nordic;
  qt.style.name = "Nordic-darker";
}
