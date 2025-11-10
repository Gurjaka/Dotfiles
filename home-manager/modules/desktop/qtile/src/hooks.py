from os.path import expanduser
import subprocess
import textwrap

from libqtile import hook
from theme import colors


# Startup hook
@hook.subscribe.startup_once
def autostart() -> None:
    """
    Hook that runs once during startup
    Used to autostart some essential apps related to Dotfiles.
    """
    from config import APPS, HOST, IS_WAYLAND

    home = expanduser("~")

    base_commands = [
        "systemctl --user restart pipewire",
        "systemctl --user restart app-com.mitchellh.ghostty.service",
        "blueman-applet",
        "udiskie",
        "flameshot",
        "focus-mode",
        "mpDris2",
        "mpd-notify",
        # f"conky -c {home}/.config/conky/conky-qtile.conf -U",
    ]

    wayland_commands = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
        "foot --server",
        "swww-daemon",
        "wallrandom",
        "swaync",
    ]

    notify_cmd = textwrap.dedent(f"""
        notify-send \
            "{colors["theme"]} Theme" \
            "$(sed -n "/{colors["theme"]} = {{/,/}};/s/.*message *= *\\"\\(.*\\)\\";.*/\\1/p" "{home}/Dotfiles/themes/default.nix")" \
            --icon="{home}/Dotfiles/themes/icons/{colors["theme"]}.svg" \
            --urgency=normal \
            --expire-time=5000
    """).strip()

    desktop_commands = [APPS["browser"], "discord --disable-gpu"]

    commands = base_commands
    if IS_WAYLAND:
        commands.extend(wayland_commands)
    if HOST == "desktop":
        commands.extend(desktop_commands)

    commands.append(notify_cmd)

    for cmd in commands:
        subprocess.Popen(
            cmd,
            shell=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )


@hook.subscribe.client_managed
def force_fullscreen(client) -> None:
    """
    Some clients won't start fullscreen (exclusive to wayland)
    With this function we force clients defined in FULLSCREEN_RULES to enter fullscreen
    """
    from config import FULLSCREEN_RULES

    if any(client.match(rule) for rule in FULLSCREEN_RULES):
        client.fullscreen = True
