{
  services.mpd = {
    enable = true;
    musicDirectory = "$HOME/Music";
    network.listenAddress = "any";
    # network.startWhenNeeded = true;
    extraConfig = ''
      bind_to_address "localhost"
      audio_output {
      	type "pipewire"
      	name "My PipeWire Output"
      }
    '';
  };
}
