{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
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

    focus-mode = {
      url = "github:Gurjaka/focus-mode";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nord-wallpapers = {
      url = "github:Gurjaka/Nord-Wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    everforest-wallpapers = {
      url = "github:Gurjaka/Everforest-Wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kanagawa-wallpapers = {
      url = "github:Gurjaka/Kanagawa-Wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
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
    agenix,
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
      colorscheme = "kanagawa"; # check themes.nix
    };

    themes = import ./themes.nix {pkgs = nixpkgs.legacyPackages.x86_64-linux;};
    selectedTheme = themes."${system-settings.colorscheme}";

    propagated-args =
      system-settings
      // {
        inherit inputs themes selectedTheme;
      };

    forAllSystems = function:
      nixpkgs.lib.genAttrs system-settings.supportedSystems (
        system: function nixpkgs.legacyPackages.${system}
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
          ./secrets
          agenix.nixosModules.default
        ];
      };
    };
    homeConfigurations.${system-settings.user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = with inputs; [
        spicetify-nix.homeManagerModules.default
        focus-mode.homeManagerModules.default
        ./home-manager/home.nix
      ];
      extraSpecialArgs = propagated-args;
    };
  };
}
