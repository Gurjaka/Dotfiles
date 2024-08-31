import os
import subprocess
from libqtile import hook, qtile
from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, ScratchPad, DropDown, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from libqtile.backend.wayland import InputConfig
from qtile_extras.widget.decorations import BorderDecoration
from libqtile.config import Key, KeyChord
from theme import colors

# Auto Start
if qtile.core.name == "wayland":  
    os.environ["XDG_SESSION_DESKTOP"] = "qtile:wlroots"
    os.environ["XDG_CURRENT_DESKTOP"] = "qtile:wlroots"
    
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/Dotfiles/nixos/modules/qtile/autostart.sh')
    subprocess.Popen([home])

# OnReload
def onreload():
    home = os.path.expanduser('~/Dotfiles/nixos/modules/qtile/reload.sh')
    subprocess.Popen([home])

onreload()

# Variables

mod = "mod4"
terminal = "kitty"
browser = "vivaldi"
launcher = "rofi -show drun"
fileManager = "thunar"
editor = "code"
ntCenter = "swaync-client -t -sw"

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
    Key([mod], "d", lazy.spawn(launcher), desc="Exec app launcher"),
    Key([mod], "e", lazy.spawn(fileManager), desc="Exec File manager"),
    Key([mod], "b", lazy.spawn(browser), desc="Exec browser"),
    Key([mod], "c", lazy.spawn(editor), desc="Exec editor"),
    Key([mod], "Tab", lazy.spawn(ntCenter), desc="Exec notification center"),
    Key([mod, "Shift"], "s", lazy.spawn('grim -g "$(slurp -d)" - | wl-copy', shell=True)),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-")),
    Key([], "XF86AudioMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),

    KeyChord([mod], "i", [
        Key([mod], "i", lazy.ungrab_all_chords())],
        mode=True,
        name='Vm Mode',
    ),
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
    ScratchPad("p", [
        DropDown("Music", "spotify", opacity=1, height=0.5, on_focus_lost_hide=False),
        DropDown("Term", "kitty", opacity=1, height=0.5, on_focus_lost_hide=False)
    ]),
    Group("1", label="DEV"),
    Group("2", label="WWW"),
    Group("3", label="SYS"),
    Group("4", label="NOTE"),
    Group("5", label="VBOX"),
    Group("6", label="ANI"),
    Group("7", label="MNG"),
    Group("8", label="DOC"),
    Group("9", label="DC"),
    Group("0", label="GAME"),
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
            Key([mod], "s", lazy.group['p'].dropdown_toggle('Music')),
            Key([mod], "a", lazy.group['p'].dropdown_toggle('Term')),

            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

if colors["theme"] == "Everforest":
    layout_theme = {
        "border_focus": "#A7C080",
        "border_normal": "#48584E",
        "border_width": 2,
        "margin": 5,
    }
elif colors["theme"] == "Nord":
    layout_theme = {
    "border_focus": "#5E81AC",
    "border_normal": "#4C566A",
    "border_width": 2,
    "margin": 5,
    }

layouts = [
    # layout.Columns(**layout_theme),
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
        wallpaper = f"~/Dotfiles/wallpapers/{colors["theme"]}/main.jpg",
        wallpaper_mode = "fill",
        top=bar.Bar(
            [
                widget.TextBox(
                    fmt = " ",
                    padding = None,
                    fontsize = 20,
                    foreground = colors["base12"],
                    mouse_callbacks = {"Button1": lambda: qtile.spawn(f"{browser} github.com/gurjaka")},                    
                ),

                widget.Clock(
                    foreground = colors["base14"],
                    format=" %a,%b,%d -  %H:%M",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base14"],
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.GroupBox(
                    active = colors["base09"],
                    inactive = colors["base03"], 
                    block_highlight_text_color = "#FFFFFF", 
                    highlight_method = "line", 
                    highlight_color = colors["base01"], 
                    this_current_screen_border = colors["base09"], 
                    urgent_alert_method = "line", 
                    urgent_border = colors["base11"],
                    disable_drag = True,
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base03"],
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.CurrentLayout(
                    foreground = colors["base08"], 
                    fmt = "| {}|",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base08"],
                            padding_x = 5,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.WindowName(
                    foreground = colors["base13"], 
                    #format = "{}",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base13"],
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
                        "launch": (colors["base01"], colors["base12"]),
                    },
                    foreground = colors["base12"],
                    name_transform=lambda name: name.upper(),
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base12"],
                            padding_x = None,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.StatusNotifier(
                    background = colors["base02"],
                    padding = 5,
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base11"],
                            padding_x = None,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.GenPollText(
                    update_interval = 300,
                    func = lambda: subprocess.check_output("printf $(uname -r)", shell=True, text=True),
                    foreground = colors["base12"],
                    fmt = ' {}',
                    decorations=[
                        BorderDecoration(
                            border_width = [0, 0, 2, 0],
                            colour = colors["base12"],
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.CPU(
                    foreground = colors["base09"],
                    format = '󰍹 Cpu:{load_percent}%',
                    mouse_callbacks = {"Button1": lambda: qtile.spawn(f"{terminal} btop")},
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base09"],
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.DF(
                    update_interval = 60,
                    foreground = colors["base14"],
                    mouse_callbacks = {'Button1': lambda: qtile.spawn(f"{terminal} df")},
                    partition = '/',
                    #format = '[{p}] {uf}{m} ({r:.0f}%)',
                    format = '🖴 Disk:{uf}{m}',
                    visible_on_warn = False,
                    decorations=[
                        BorderDecoration(
                            border_width = [0, 0, 2, 0],
                            colour = colors["base14"],
                            padding_x = 3,
                            padding_y = None,
                        )
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.Memory(
                    foreground = colors["base15"],
                    format = ' Mem:{NotAvailable:.0f}{mm}',
                    mouse_callbacks = {"Button1": lambda: qtile.spawn(f"{terminal} btop")},
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base15"],
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.PulseVolume(
                    foreground = colors["base13"],
                    fmt = " :{}",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base13"],
                            padding_x = 3,
                            padding_y = None,
                        ),
                    ],
                ),

                widget.Spacer(
                    length = 2,
                ),

                widget.KeyboardLayout(
                    foreground = colors["base08"],
                    configured_keyboards = ["us", "ge"],
                    display_map = {"us": "US", "ge": "GE"},
                    fmt = " Kbd:{}",
                    decorations = [
                        BorderDecoration(
                            border_width = [0,0,2,0],
                            colour = colors["base08"],
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
            background = colors["base00"],
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
bring_front_click = True
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    **layout_theme,
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
        kb_layout = "us, ge", 
        kb_options = "grp:alt_shift_toggle",
    ),
}

wl_xcursor_theme = "Breeze_Light"
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "QTILE"
