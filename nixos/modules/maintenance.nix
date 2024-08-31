{ inputs, ... }:

{
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--print-build-logs"
    ];
  };

  nix.optimise.automatic = true;
  
  nix.gc.automatic = true;
}