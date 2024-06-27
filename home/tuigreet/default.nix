#  _____         _   ____                    _
# |_   _| _   _ (_) / ___| _ __   ___   ___ | |_
#   | |  | | | || || |  _ | '__| / _ \ / _ \| __|
#   | |  | |_| || || |_| || |   |  __/|  __/| |_
#   |_|   \__,_||_| \____||_|    \___| \___| \__|

{config, lib, inputs, pkgs, ...}:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session --user-menu";
      user = "greeter";
      };
    };
  };
}