{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qtile-flake = {
      url = "github:qtile/qtile/a4ec8ec";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/3f9cf9f";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, qtile-flake, ... }:
  let
    # System settings 
    host = "desktop"; # select hostname
    user = "gurami"; # select user
    timezone = "Asia/Tbilisi"; # select timezone
    locale = "en_US.UTF-8"; # select locale
    theme = "nord"; # select theme currently available nord/everforest
  in
  {
    nixosConfigurations = {
      # Host config
      "${host}" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # System architecture
        specialArgs = {
          inherit inputs host user timezone locale theme;
        }; # Pass inputs
      
        modules = [
          (_: { nixpkgs.overlays = [ qtile-flake.overlays.default ]; })
          ./nixos/nixos.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs host user theme;
              }; # Pass arguments to home.nix

              users = {
                "${user}" = import ./home-manager/home.nix;
              };
              
              sharedModules = with inputs; [
                spicetify-nix.homeManagerModules.default
                nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };
    };
  };
}
