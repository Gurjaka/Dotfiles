{host, ...}: {
  networking = {
    hostName = "${host}"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
  };
}
