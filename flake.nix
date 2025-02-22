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

    nordic = {
      url = "github:EliverLara/Nordic";
      flake = false;
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    # System settings
    system-settings = {
      supportedSystems = ["x86_64-linux"]; # System architecture
      host = "desktop"; # select hostname desktop/laptop
      user = "gurami"; # select user
      drivers = "amd"; # select drivers amd/nvidia/intel
      timezone = "Asia/Tbilisi"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      shell = "fish"; # zsh/fish/bash
    };

    propagated-args =
      system-settings
      // {
        inherit inputs;
      };

    forAllSystems = function:
      nixpkgs.lib.genAttrs system-settings.supportedSystems (
        system: function (import nixpkgs {inherit system;})
      );
  in {
    formatter = forAllSystems (pkgs: pkgs.alejandra);
    nixosConfigurations = {
      # Host config
      "${system-settings.host}" = nixpkgs.lib.nixosSystem {
        specialArgs = propagated-args;

        modules = [
          ./nixos/configuration.nix
          ./overlays.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              extraSpecialArgs = propagated-args;
              users = {
                "${system-settings.user}" = import ./home-manager/home.nix;
              };
              sharedModules = with inputs; [spicetify-nix.homeManagerModules.default];
            };
          }
        ];
      };
    };
  };
}
