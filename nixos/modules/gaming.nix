{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; 
      dedicatedServer.openFirewall = true; 
      localNetworkGameTransfers.openFirewall = true; 
      gamescopeSession.enable = true;
    };
    gamemode = {
      enable = true;
      enableRenice = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
