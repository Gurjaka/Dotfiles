{
  services.pipewire = {
    enable = true;
    extraConfig.pipewire = {
      "10-clock-rate" = {
        context.properties = {
          default.clock.rate = 48000;
        };
      };
      "11-no-upmixing" = {
        stream.properties = {
          channelmix.upmix = false;
        };
      };
      "12-anti-buzz" = {
        context.properties = {
          # Disable CPU power saving that interferes with timing
          default.clock.power-of-zero = false;

          # Set clock quantum (buffer size in frames)
          default.clock.quantum = 512;
          default.clock.min-quantum = 512;
          default.clock.max-quantum = 1024;

          # Use monotonic clock to reduce jitter
          default.clock.monotonic = true;
        };
      };
    };
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
