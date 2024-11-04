{ pkgs, user, shell, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "gamemode" ]; # Enable ‘sudo’ for the user.
    # Enable zsh for user
    shell = pkgs.${shell};
  };
}
