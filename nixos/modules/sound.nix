{
  services.pipewire = {
    enable = true;
    extraConfig.pipewire = {
      "10-clock-rate" = {
        context.properties = {
          default.clock.rate = 96000;
        };
      };
      "11-no-upmixing" = {
        stream.properties = {
          channelmix.upmix = false;
        };
      };
      "12-anti-buzz" = {
        context.properties = {
          default.clock.power-of-zero = false;
          default.clock.quantum = 256;
          default.clock.min-quantum = 256;
          default.clock.max-quantum = 1024;
        };
      };
    };
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
