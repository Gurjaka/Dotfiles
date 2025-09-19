{
  pkgs,
  selectedTheme,
  shell,
  font,
  ...
}: let
  footLiveReload = pkgs.writeShellScriptBin "foot_live_reload" ''
    config_path=$HOME/.config/foot/foot.ini
    last_mtime=0
    parent=$PPID

    while kill -0 "$parent" 2>/dev/null; do
    	mtime=$(stat -c %Y "$config_path" 2>/dev/null || echo 0)
    	if [ "$mtime" -ne "$last_mtime" ]; then
    		last_mtime=$mtime

    		# regular/bright colors
    		sed -n -r 's/^\w*(regular|bright)([0-9])=([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2}).*/\1 \2 \3 \4 \5/p' "$config_path" |
    		while read color_type idx r g b; do
    			[ "$color_type" = "bright" ] && idx=$((idx + 8))
    			echo -ne "\e]4;$idx;rgb:$r/$g/$b\e\\"
    		done

    		# foreground
    		sed -n -r 's/^\w*foreground=([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2}).*/\1 \2 \3/p' "$config_path" |
    		while read r g b; do
    			echo -ne "\e]10;rgb:$r/$g/$b\e\\"
    		done

    		# background
    		sed -n -r 's/^\w*background=([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2}).*/\1 \2 \3/p' "$config_path" |
    		while read r g b; do
    			echo -ne "\e]11;rgb:$r/$g/$b\e\\"
    		done
    	fi
    	sleep 1
    done &
  '';
in {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "foot";
        font = "${font}:size=12, monospace:size=14";
        pad = "20x20";
        dpi-aware = "no";
        shell = "${shell} -c \"foot_live_reload &; exec ${shell}\"";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = let
        strip = color: builtins.substring 1 6 color;
      in {
        foreground = strip selectedTheme.colors.base05;
        background = strip selectedTheme.colors.base01;

        selection-foreground = strip selectedTheme.colors.base04;
        selection-background = strip selectedTheme.colors.base03;

        regular0 = strip selectedTheme.colors.base02;
        regular1 = strip selectedTheme.colors.base11;
        regular2 = strip selectedTheme.colors.base14;
        regular3 = strip selectedTheme.colors.base13;
        regular4 = strip selectedTheme.colors.base09;
        regular5 = strip selectedTheme.colors.base15;
        regular6 = strip selectedTheme.colors.base08;
        regular7 = strip selectedTheme.colors.base05;

        bright0 = strip selectedTheme.colors.base03;
        bright1 = strip selectedTheme.colors.base11;
        bright2 = strip selectedTheme.colors.base14;
        bright3 = strip selectedTheme.colors.base13;
        bright4 = strip selectedTheme.colors.base09;
        bright5 = strip selectedTheme.colors.base15;
        bright6 = strip selectedTheme.colors.base07;
        bright7 = strip selectedTheme.colors.base06;

        dim0 = strip selectedTheme.colors.base00;
        dim1 = strip selectedTheme.colors.base11;
        dim2 = strip selectedTheme.colors.base14;
        dim3 = strip selectedTheme.colors.base13;
        dim4 = strip selectedTheme.colors.base09;
        dim5 = strip selectedTheme.colors.base15;
        dim6 = strip selectedTheme.colors.base08;
        dim7 = strip selectedTheme.colors.base04;
      };
    };
  };

  home.packages = [footLiveReload];
}
