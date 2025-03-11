{pkgs, ...}: {
  home.packages = with pkgs; [youtube-music];
  xdg.configFile = {
    "YouTube\ Music/yt-music.css".source = ./yt-music.css;
    "YouTube\ Music/config.json".source = ./config.json;
  };
}
