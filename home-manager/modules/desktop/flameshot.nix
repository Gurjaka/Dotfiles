{pkgs, ...}: {
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override {enableWlrSupport = true;};
    settings = {
      General = {
        uiColor = "#81a1c1";
        drawColor = "#bf616a";
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        disabledGrimWarning = true;
        showDesktopNotification = false;
      };
    };
  };
}
