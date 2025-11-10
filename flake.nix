{
  description = "Gurjaka's NixOS/Home-Manager playground";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux"]; # System architecture

    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f nixpkgs.legacyPackages.${system});

    mkFlatConfigurations = systems: attrs: mapFn:
      nixpkgs.lib.foldl (acc: system: acc // (mapFn system attrs.${system})) {} systems;

    flake_attributes = forAllSystems (pkgs: rec {
      # System settings
      system_settings = {
        host = "desktop"; # select hostname desktop/laptop
        drivers = "amd"; # select drivers amd/nvidia/intel
        timezone = "Asia/Tbilisi"; # select timezone
        locale = "en_US.UTF-8"; # select locale
        shell = "fish"; # zsh/fish/bash
        colorscheme = "nord"; # check themes.nix
        font = "FiraCode Nerd Font Ret";
      };

      # User info
      user_info = {
        user = "gurami"; # select user
        userEmail = "esartia.gurika@gmail.com"; # define git email
        userName = "Gurjaka"; # define git username
      };

      themes = import ./themes {inherit pkgs;};
      selectedTheme = themes."${system_settings.colorscheme}";

      propagated_args =
        system_settings
        // user_info
        // {
          inherit inputs themes selectedTheme;
        };

      nixos_modules = with inputs; [
        ./nixos/configuration.nix
        ./secrets
        agenix.nixosModules.default
      ];

      homeManager_modules = with inputs; [
        ./home-manager/home.nix
        spicetify-nix.homeManagerModules.default
        focus-mode.homeManagerModules.default
      ];
    });
  in {
    formatter = forAllSystems (pkgs: pkgs.alejandra);

    nixosConfigurations = mkFlatConfigurations supportedSystems flake_attributes (
      system: systemAttrs: {
        # Host config
        "${systemAttrs.system_settings.host}" = nixpkgs.lib.nixosSystem {
          specialArgs = systemAttrs.propagated_args;
          modules = systemAttrs.nixos_modules;
        };
      }
    );

    homeConfigurations = mkFlatConfigurations supportedSystems flake_attributes (
      system: systemAttrs: {
        ${systemAttrs.user_info.user} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = systemAttrs.homeManager_modules;
          extraSpecialArgs = systemAttrs.propagated_args;
        };
      }
    );
  };

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

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
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

    gruvbox-wallpapers = {
      url = "github:Gurjaka/gruvbox-wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
