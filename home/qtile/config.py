# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import hook, qtile
from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from libqtile.backend.wayland import InputConfig
from qtile_extras.widget.decorations import BorderDecoration

mod = "mod4"
terminal = guess_terminal()

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "Down", lazy.layout.shrink(), desc="Shrink window"),
    Key([mod, "control"], "Up", lazy.layout.grow(), desc="Grow window"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "v", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "Shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Spawn a command using a prompt widget"),
    Key([mod], "e", lazy.spawn("nautilus"), desc="Exec Thunar file manager"),
    Key([mod], "b", lazy.spawn("vivaldi"), desc="Exec Vivaldi browser"),
    Key([mod], "c", lazy.spawn("code"), desc="Exec VSCode"),
    Key([mod], "Tab", lazy.spawn("swaync-client -t -sw"), desc="Exec VSCode"),
    Key([mod, "Shift"], "s", lazy.spawn('grim -g "$(slurp -d)" - | wl-copy', shell=True)),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-")),
    Key([], "XF86AudioMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


# groups = [Group(i) for i in "123456789"]
groups = [
    Group("1", label="DEV"),
    Group("2", label="WWW"),
    Group("3", label="SYS"),
    Group("4", label="DOC"),
    Group("5", label="VBOX"),
    Group("6", label="ANI"),
    Group("7", label="MNG"),
    Group("8", label="MUS"),
    Group("9", label="DC"),
]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_theme = {
    "border_focus": "#5E81AC",
    "border_normal": "#4C566A",
    "border_width": 2,
    "margin": 5,
}

layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    #layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Fira Code Medium",
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper = "~/Dotfiles/home/wallpapers/nord-ign_moon_raven.png",
        wallpaper_mode = "fill",
        top=bar.Bar(
            [
                widget.TextBox(
                    fmt = " ",
                    padding = None,
                    fontsize = 20,
                    foreground = "#8FBCBB",
                    mouse_callbacks = {"Button1": lambda: qtile.cmd_spawn("brave -e nordtheme.com")},                    
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#8FBCBB",
                            padding_x = 6,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Clock(
                    foreground = "#D08770",
                    format="%I:%M %p",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#D08770",
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                    ),

                widget.Spacer(
                    length = 2,
                ),

                widget.GroupBox(
                    active = "#81A1C1",
                    inactive = "#4C566A", 
                    block_highlight_text_color = "#FFFFFF", 
                    highlight_method = "line", 
                    highlight_color = "#3B4252", 
                    this_current_screen_border = "#81A1C1", 
                    urgent_alert_method = "line", 
                    urgent_border = "#BF616A",
                    disable_drag = True,
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#4C566A",
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                    ),

                widget.Spacer(
                    length = 2,
                ),

                widget.CurrentLayout(
                    foreground = "#88C0D0", 
                    fmt = "|{}|",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#88C0D0",
                            padding_x = 5,
                            padding_y = None,
                        ),
                    ],
                    ),

                widget.WindowName(
                    foreground = "#EBCB8B", 
                    #format = "{}",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#EBCB8B",
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                    ),

                widget.Spacer(
                    length = 2,
                ),

                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.StatusNotifier(
                    background = "#3B4252",
                    padding = 5,
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#5E81AC",
                            padding_x = None,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 4,
                ),

                widget.Battery(
                    foreground = "#A3BE8C",
                    charge_char = "󰂄",
                    discharge_char = "󰁿",
                    empty_char = "󰂎",
                    format = '{char} {percent:2.0%} {hour:d}:{min:02d}',
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#A3BE8C",
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.CPU(
                    foreground = "#BF616A",
                    format = ' {load_percent}%',
                    mouse_callbacks = {"Button1": lambda: qtile.spawn("alacritty -e htop")},
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#BF616A",
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.Memory(
                    foreground = "#B48EAD",
                    format = '{NotAvailable:.0f}{mm}/{MemTotal:.0f}{mm}',
                    mouse_callbacks = {"Button1": lambda: qtile.spawn("alacritty -e btop")},
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#B48EAD",
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.PulseVolume(
                    foreground = "#EBCB8B",
                    fmt = " :{}",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#EBCB8B",
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.KeyboardLayout(
                    foreground = "#88C0D0",
                    configured_keyboards = ["us", "ge"],
                    display_map = {"us": "us", "ge": "ge"},
                    fmt = "{}",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = "#88C0D0",
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),
            ],
            24,
            background = "#2E3440",
            #border_color = "#4C566A",
            #border_width = 2,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = {
    "type:pointer": InputConfig(
        accel_profile = "flat",
    ),
    
    "type:keyboard": InputConfig(
        kb_layout = "us,ge", 
        kb_options = "grp:alt_shift_toggle",
    ),
}

wl_xcursor_theme = "Breeze_Light"
wl_xcursor_size = 24

# Auto Start
if qtile.core.name == "wayland":  
    os.environ["XDG_SESSION_DESKTOP"] = "qtile:wlroots"
    os.environ["XDG_CURRENT_DESKTOP"] = "qtile:wlroots"
    
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/Dotfiles/home/qtile/autostart.sh')
    subprocess.Popen([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "QTILE"
