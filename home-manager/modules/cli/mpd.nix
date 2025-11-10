{
  pkgs,
  user,
  ...
}: let
  mus = "/home/${user}/Music";
in {
  services = {
    mpd = {
      enable = true;
      musicDirectory = mus;
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
  };

  home.packages = with pkgs; [mpdris2];
  xdg.configFile."mpDris2/mpDris2.conf".text = ''
    [Connection]
    music_dir = ${mus}

    [Bling]
    notify = False
    notify_paused = True
    mmkeys = True
    cdprev = True

    [Notify]
    urgency = 0
    timeout = -1
    summary =
    body =
    paused_summary =
    paused_body =
  '';
}
