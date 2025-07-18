{
  pkgs,
  selectedTheme,
  ...
}: {
  home.packages = [pkgs.conky];
  xdg.configFile."conky/conky-qtile.conf".text = ''
    conky.config = {

    	--Various settings
    	background = true,
    	cpu_avg_samples = 2,
    	diskio_avg_samples = 10,
    	double_buffer = true,
    	if_up_strictness = 'address',
    	net_avg_samples = 2,
    	no_buffers = true,
    	temperature_unit = 'fahrenheit',
    	text_buffer_size = 2048,
    	update_interval = 1,
    	imlib_cache_size = 0,

    	-- Placement (For SINGLE monitor users!)
    	alignment = 'top_right',
    	gap_x = 30,
    	gap_y = 300,

    		-- Size
    	minimum_height = 200,
    	minimum_width = 260,
    	maximum_width = 260,

    	--Graphical
    	border_inner_margin = 5,
    	border_outer_margin = 5,
    	border_width = 0,
    	default_bar_width = 260,
    	default_bar_height = 10,
    	default_gauge_height = 25,
    	default_gauge_width =40,
    	default_graph_height = 40,
    	default_graph_width = 153,
    	default_shade_color = '#000000',
    	default_outline_color = '#000000',
    	draw_borders = false,
    	draw_graph_borders = true,
    	draw_shades = false,
    	draw_outline = false,
    	stippled_borders = 0,

    	--Textual
    	format_human_readable = true,
    	font  = 'JetBrains Mono Nerd Font:Bold:size=10',
    	font2 = 'JetBrains Mono Nerd Font:Bold:size=30',
    	font3 = 'JetBrains Mono Nerd Font:size=12',
    	font4 = 'JetBrains Mono Nerd Font:Bold:size=9',
    	max_text_width = 0,
    	max_user_text = 16384,
    	override_utf8_locale = true,
    	short_units = true,
    	top_name_width = 21,
    	top_name_verbose = false,
    	uppercase = false,
    	use_spacer = 'none',
    	use_xft = true,
    	xftalpha = 1,

    	--Windows
    	own_window = true,
    	own_window_argb_value = 255,
    	own_window_argb_visual = true,
    	own_window_class = 'Conky',
    	own_window_colour = '${selectedTheme.base01}',
    	own_window_transparent = false,
    	own_window_title = 'qtile_conky',
    	own_window_type = 'override',
    	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',

    	color0 = '${selectedTheme.base15}',
    	color1 = '${selectedTheme.base04}',
    	color2 = '${selectedTheme.base08}',
    	color3 = '${selectedTheme.base13}',
    };

    conky.text = [[
    ''${alignc}''${color0}''${font2}''${time %H:%M}''${font}
    ''${voffset 6}''${alignc}''${color0}''${font3}''${time %b %d, %Y}''${font}''${color}
    ''${voffset 18}''${goto 12}''${color3}CPU''${goto 50}$cpu%
    ''${color2}''${goto 12}''${cpubar 8,254}
    ''${voffset 5}''${goto 12}$font''${color1}''${top name 1}$alignr$color''${top cpu 1}%
    ''${goto 12}''${color1}''${top name 2}$alignr$color''${top cpu 2}%
    ''${goto 12}''${color1}''${top name 3}$alignr$color''${top cpu 3}%
    ''${voffset 14}''${goto 12}''${color3}RAM''${goto 50}$mem/$memmax
    ''${color2}''${goto 12}''${membar 8,254}''${color}
    ''${goto 12}''${voffset 5}''${color1}''${top_mem name 1}$alignr$color''${top_mem mem_res 1}
    ''${goto 12}''${color1}''${top_mem name 2}$alignr$color''${top_mem mem_res 2}
    ''${goto 12}''${color1}''${top_mem name 3}$alignr$color''${top_mem mem_res 3}
    ''${voffset 18}''${color1}''${alignc}''${font4}QTILE KEYBINDINGS''${font}''${color}
    ''${color1}''${hr}''${color}
    ''${color1}[S]+h/j/k/l''${alignr}''${color2}focus l/d/u/r''${color}
    ''${color1}[S]+Shift+h/j/k/l''${alignr}''${color2}move l/d/u/r''${color}
    ''${color1}[S]+[SPACE]''${alignr}''${color2}focus next window''${color}
    ''${color1}[S]+Ctrl+j/k''${alignr}''${color2}shrink/grow window''${color}
    ''${color1}[S]+n''${alignr}''${color2}normalize window sizes''${color}
    ''${color1}[S]+Return''${alignr}''${color2}launch terminal''${color}
    ''${color1}''${hr}''${color}
    ''${color1}[S]+d''${alignr}''${color2}app launcher''${color}
    ''${color1}[S]+b''${alignr}''${color2}launch browser''${color}
    ''${color1}[S]+e''${alignr}''${color2}launch file manager''${color}
    ''${color1}[S]+c''${alignr}''${color2}launch editor''${color}
    ''${color1}[S]+Ctrl+t''${alignr}''${color2}theme switcher''${color}
    ''${color1}[S]+w''${alignr}''${color2}random wallpaper''${color}
    ''${color1}[S]+Tab''${alignr}''${color2}notification center''${color}
    ''${color1}''${hr}''${color}
    ''${color1}[S]+m''${alignr}''${color2}toggle DND mode''${color}
    ''${color1}[S]+f''${alignr}''${color2}toggle fullscreen''${color}
    ''${color1}[S]+Shift+space''${alignr}''${color2}toggle floating''${color}
    ''${color1}[S]+z''${alignr}''${color2}next layout''${color}
    ''${color1}[S]+Shift+q''${alignr}''${color2}close window''${color}
    ''${color1}[S]+Ctrl+r''${alignr}''${color2}reload qtile''${color}
    ''${color1}[S]+Ctrl+q''${alignr}''${color2}quit qtile''${color}
    ''${color1}''${hr}''${color}
    ''${color1}[S]+a''${alignr}''${color2}scratchpad terminal''${color}
    ''${color1}[S]+s''${alignr}''${color2}scratchpad music''${color}
    ''${color1}[S]+Shift+s''${alignr}''${color2}screenshot''${color}
    ''${color1}[S]+o''${alignr}''${color2}open last screenshot''${color}
    ''${color1}[S]+Ctrl+p''${alignr}''${color2}color picker''${color}
    ''${color1}Shift+Tab''${alignr}''${color2}change keyboard layout''${color}
    ''${color1}''${hr}''${color}
    ''${color1}[S]+p''${alignr}''${color2}pause/unpause mpd''${color}
    ''${color1}[S]+Shift+period''${alignr}''${color2}next song''${color}
    ''${color1}[S]+Shift+comma''${alignr}''${color2}previous song''${color}
    ''${color1}[S]+semicolon''${alignr}''${color2}volume up''${color}
    ''${color1}[S]+Shift+semicolon''${alignr}''${color2}volume down''${color}
    ]];
  '';
}
