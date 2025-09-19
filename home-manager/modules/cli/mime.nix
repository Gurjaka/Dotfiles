{
  lib,
  config,
  ...
}: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/*" = "nvim.desktop";
      "text/markdown" = "nvim.desktop";
      "text/x-devicetree-source" = "nvim.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
      "application/msword" = "libreoffice-writer.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop";
      "image/png" = "org.gnome.eog.desktop";
      "image/jpeg" = "org.gnome.eog.desktop";
      "image/gif" = "org.gnome.eog.desktop";
      "image/webp" = "org.gnome.eog.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
  home.activation = lib.mkIf config.xdg.mimeApps.enable {
    OverrideMime = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
      export mimelist=~/.config/mimeapps.list
      if [ -e "$mimelist" ]; then
      	rm -f "$mimelist"
      fi
    '';
  };
}
