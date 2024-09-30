{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qtile-flake = {
      url = "github:qtile/qtile";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qtile-extras-flake = {
      url = "github:elparaguayo/qtile-extras";
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

  outputs = inputs@{ self, nixpkgs, home-manager, qtile-flake, ... }:
  let
    # System settings 
    host = "desktop"; # select hostname desktop/laptop
    user = "gurami"; # select user
    drivers = "amd"; # select drivers amd/nvidia/intel
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
          inherit inputs host user drivers timezone locale theme;
        }; # Pass inputs
      
        modules = [
          (_: { nixpkgs.overlays = [ qtile-flake.overlays.default ]; })
          ./nixos/configuration.nix
          ./overlays.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs host user theme;
              }; # Pass arguments to home.nix

              backupFileExtension = "backup";

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
