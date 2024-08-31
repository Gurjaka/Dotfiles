{ inputs, pkgs, user, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    # Enable Fish for user
    shell = pkgs.fish;
  };
}