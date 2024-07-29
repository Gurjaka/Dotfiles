{ inputs, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gurami = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    # Enable Fish for user
    shell = pkgs.fish;
  };

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "gurami" = import ../home-manager/home.nix;
    };
    sharedModules = [
      inputs.spicetify-nix.homeManagerModules.default
      inputs.nixvim.homeManagerModules.nixvim
    ];
  };
}