{
  services.pipewire = {
    enable = true;

    # Pulse configuration optimized for low-impedance IEMs
    extraConfig.pipewire-pulse = {
      "99-pulse-custom" = {
        pulse.properties = {
          # Smaller buffer sizes for lower latency with sensitive IEMs
          "pulse.min.req" = "512/48000";
          "pulse.default.req" = "512/48000";
          "pulse.min.frag" = "512/48000";
          "pulse.default.frag" = "512/48000";
          "pulse.default.tlength" = "1024/48000";
          # Better volume handling for sensitive drivers
          "pulse.default.volume" = 0.5;
          "pulse.volume.limit" = 0.8;
        };
      };
    };

    extraConfig.pipewire = {
      "10-clock-rate" = {
        context.properties = {
          "default.clock.rate" = 48000;
          # Add hi-res rates that complement the Aria 2's capabilities
          "default.clock.allowed-rates" = [44100 48000 88200 96000 176400 192000];
          "default.clock.force-rate" = 0;
        };
      };

      "11-mix-settings" = {
        stream.properties = {
          "channelmix.upmix" = false;
          "channelmix.downmix" = false;
          "channelmix.normalize" = false;
          # Preserve dynamic range for detailed IEMs
          "stream.audio.rate" = 1.0;
          "stream.audio.volume" = 0.7; # Conservative volume for sensitive IEMs
          "channelmix.mix-lfe" = false;
        };
      };

      "12-buffer-quality" = {
        context.properties = {
          "default.clock.power-of-zero" = false;
          # Smaller quantum for responsive audio with IEMs
          "default.clock.quantum" = 512;
          "default.clock.min-quantum" = 512;
          "default.clock.max-quantum" = 1024;
          "default.clock.monotonic" = true;
          # Better timing precision
          "clock.power-of-two-quantum" = true;
        };
      };

      "13-audiophile-quality" = {
        stream.properties = {
          # Maximum resampling quality for detail retrieval
          "resample.quality" = 15;
          "resample.disable" = false;
          # 32-bit float processing for headroom
          "convert.mix.bitdepth" = 32;
          "convert.dither.method" = "triangular-hf"; # Better for sensitive transducers
          "node.pause-on-idle" = false;
          "node.latency" = "512/48000";
          "audio.format" = "F32LE";
          "audio.position" = "FL,FR";
          # Preserve audio fidelity
          "audio.convert" = "none";
          "resample.peaks" = false;
        };
      };

      "14-anti-xrun" = {
        context.modules = [
          {
            name = "libpipewire-module-rt";
            args = {
              "nice.level" = -19; # Higher priority for audio thread
              "rt.prio" = 99; # Maximum RT priority
              "rt.time.soft" = 1000000; # 1 second soft limit
              "rt.time.hard" = 1000000; # 1 second hard limit
            };
            flags = ["ifexists" "nofail"];
          }
        ];
      };

      # Additional config for IEM-specific optimizations
      "15-iem-optimizations" = {
        stream.properties = {
          # Disable unnecessary processing that can add noise
          "filter.graph" = "";
          "audio.adapt.follower" = "";
          # Ensure bit-perfect output when possible
          "audio.rate" = 48000;
          "audio.channels" = 2;
          # Optimize for stereo imaging of IEMs
          "channelmix.disable" = true;
        };
        context.properties = {
          # Reduce system audio interference
          "support.dbus" = false;
          # Optimize scheduling for audio priority
          "default.clock.force-quantum" = 512;
        };
      };

      # Low-latency profile for gaming/monitoring
      "16-low-latency-profile" = {
        context.properties = {
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 512;
        };
        stream.properties = {
          "node.latency" = "256/48000";
          "resample.quality" = 4; # Lower quality but faster processing
        };
        # Uncomment the flag below to enable low-latency mode
        flags = ["default"];
      };
    };

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # ALSA optimizations for direct hardware access
    wireplumber.extraConfig = {
      alsa-monitor = {
        properties = {
          "alsa.use-acp" = false;
          "alsa.midi" = false; # Disable if not needed
          # Better hardware parameter handling
          "api.alsa.period-size" = 512;
          "api.alsa.period-num" = 2;
          "api.alsa.headroom" = 1024;
          # Disable hardware mixing for pure output
          "api.alsa.disable-mmap" = false;
          "api.alsa.use-chmap" = false;
        };
      };

      # Bluetooth codec preferences (if using wireless)
      bluetooth-monitor = {
        properties = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.codec.ldac.quality" = "hq";
          "bluez5.codec.aac.bitrate" = 320000;
        };
      };
    };
  };

  # System-level audio optimizations
  boot.kernel.sysctl = {
    # Reduce audio dropouts
    "vm.swappiness" = 1;
    # Better real-time scheduling
    "kernel.sched_rt_runtime_us" = 950000;
    "kernel.sched_rt_period_us" = 1000000;
  };
}
