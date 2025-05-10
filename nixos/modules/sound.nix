{
  services.pipewire = {
    enable = true;
    # Better global settings for Pulse
    extraConfig.pipewire-pulse = {
      "99-pulse-custom" = {
        pulse.properties = {
          # Use string values for division expressions
          "pulse.min.req" = "1024/48000";
          "pulse.default.req" = "1024/48000";
          "pulse.min.frag" = "1024/48000";
          "pulse.default.frag" = "1024/48000";
          "pulse.default.tlength" = "1024/48000";
        };
      };
    };
    extraConfig.pipewire = {
      "10-clock-rate" = {
        context.properties = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [44100 48000 96000];
        };
      };
      "11-mix-settings" = {
        stream.properties = {
          "channelmix.upmix" = false;
          "channelmix.downmix" = false;
          "channelmix.normalize" = false;
          "stream.audio.rate" = 1.0;
          "stream.audio.volume" = 1.0;
        };
      };
      "12-buffer-quality" = {
        context.properties = {
          "default.clock.power-of-zero" = false;
          "default.clock.quantum" = 1024;
          "default.clock.min-quantum" = 1024;
          "default.clock.max-quantum" = 1024;
          "default.clock.monotonic" = true;
        };
      };
      "13-audiophile-quality" = {
        stream.properties = {
          "resample.quality" = 10;
          "resample.disable" = false;
          "convert.mix.bitdepth" = 32;
          "convert.dither.method" = "noise";
          "node.pause-on-idle" = false;
          # Use string format for division
          "node.latency" = "1024/48000";
          "audio.format" = "F32LE";
          "audio.position" = "FL,FR";
        };
      };
      "14-anti-xrun" = {
        context.modules = [
          {
            name = "libpipewire-module-rt";
            args = {
              "nice.level" = -15;
              "rt.prio" = 95;
              "rt.time.soft" = 500000;
              "rt.time.hard" = 500000;
            };
            flags = ["ifexists" "nofail"];
          }
        ];
      };
    };
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    # Lower latency ALSA settings
    wireplumber.extraConfig.alsa-monitor = {
      properties = {
        "alsa.use-acp" = false;
        "alsa.midi" = true;
      };
    };
  };
}
