{
  pkgs,
  selectedTheme,
  ...
}: {
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override {enableWlrSupport = true;};
    settings = {
      General = {
        uiColor = "${selectedTheme.colors.base09}";
        drawColor = "${selectedTheme.colors.base11}";
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        disabledGrimWarning = true;
        showDesktopNotification = false;
      };
    };
  };
}
