{
  pkgs,
  drivers,
  selectedTheme,
  ...
}: {
  programs.btop = {
    enable = true;
    package =
      if drivers == "amd"
      then pkgs.btop-rocm
      else if drivers == "nvidia"
      then pkgs.btop-cuda
      else pkgs.btop;
    settings.color_theme = "dynamic-theme";
    themes = {
      dynamic-theme = ''
        theme[main_bg]     = "${selectedTheme.colors.base01}"
        theme[main_fg]     = "${selectedTheme.colors.base04}"
        theme[title]       = "${selectedTheme.colors.base08}"
        theme[highlight]   = "${selectedTheme.colors.base09}"
        theme[selected_bg] = "${selectedTheme.colors.base03}"
        theme[selected_fg] = "${selectedTheme.colors.base06}"
        theme[inactive_fg] = "${selectedTheme.colors.base03}"
        theme[graph_line]  = "${selectedTheme.colors.base10}"
        theme[proc_misc]   = "${selectedTheme.colors.base07}"
        theme[cpu_box]     = "${selectedTheme.colors.base11}"
        theme[mem_box]     = "${selectedTheme.colors.base12}"
        theme[net_box]     = "${selectedTheme.colors.base14}"
        theme[disk_box]    = "${selectedTheme.colors.base13}"
        theme[proc_box]    = "${selectedTheme.colors.base15}"
      '';
    };
  };
}
