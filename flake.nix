{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qtile = {
      url = "github:qtile/qtile";
      flake = false;
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    # System settings 
    host = "desktop"; # select hostname
    user = "gurami"; # select user
    timezone = "Asia/Tbilisi"; # select timezone
    locale = "en_US.UTF-8"; # select locale
  in
  {
    nixosConfigurations = {
      # Host config
      "${host}" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # System architecture
        specialArgs = {
          inherit inputs;
          inherit host; 
          inherit user; 
          inherit timezone; 
          inherit locale;
        }; # Pass inputs
      
        modules = [
          ./nixos/nixos.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs; 
                inherit host; 
                inherit user;
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
