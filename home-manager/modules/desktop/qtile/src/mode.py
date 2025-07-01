import threading
import subprocess
import time
from libqtile.log_utils import logger
from theme import colors


class Mode:
    """
    A class to manage and toggle between two different
    themes for window layouts in a Qtile window manager.
    """

    def __init__(self, qtile) -> None:
        """
        Initializes the theme manager with default and "Do Not Disturb" (dnd) themes.
        """

        logger.info("Initializing Mode theme manager with default and DND themes.")

        self.qtile = qtile

        self.default = {
            "margin": 5,
            "border_width": 2,
            "border_focus": colors["base10"],
            "border_normal": colors["base03"],
            "single_border_width": 2,
            "single_margin": 5,
        }

        self.dnd = {
            "margin": 0,
            "border_width": 0,
            "border_focus": "",
            "border_normal": "",
            "single_border_width": 0,
            "single_margin": 0,
        }

        self.current = self.default # on startup Qtile is using default theme
        self.last_dnd_state = "default"

    def toggle(self, new_theme=None) -> None:
        """
        Toggles the current theme between default and "Do Not Disturb" (dnd),
        and updates layout settings accordingly.
        """
        if not new_theme:
            new_theme = "dnd" if self.current == self.default else "default"
        logger.info(f"Toggling theme. Switching to: {new_theme}")

        self.current = self.dnd if self.current == self.default else self.default
        logger.debug(f"New theme settings: {self.current}")

        for group in self.qtile.groups:
            for layout in group.layouts:
                for attr in self.current:
                    if hasattr(layout, attr):
                        setattr(layout, attr, self.current[attr])

        self.qtile.current_group.layout_all()
        self.qtile.cmd_hide_show_bar()

        try:
            subprocess.Popen(["swaync-client", "--toggle-dnd"])
            logger.info("Toggled Do Not Disturb mode via swaync-client.")
        except Exception as e:
            logger.warning(f"Failed to toggle DND mode: {e}")

    def get_dnd_flag(self) -> bool:
        """
        Checks the current Do Not Disturb (DND) state by reading from a temp file.

        The file `/tmp/dnd_flag` is expected to contain either 'true' or 'false'.
        If the file does not exist, we assume DND is off and return False.

        Returns:
            bool: True if DND is enabled (file contains 'true'), else False.
        """
        try:
            with open("/tmp/dnd_flag") as f:
                return f.read().strip().lower() == "true"
        except FileNotFoundError:
            return False


    def start_check_dnd_thread(self):
        """
        Starts a background thread to continuously monitor the DND flag.

        The thread reads the current DND status once every second by calling `get_dnd_flag`.
        If the state has changed since the last check, it updates the internal state and 
        calls `toggle()` to switch the layout theme accordingly.

        This function should be called once, typically at startup, to begin monitoring.
        """
        def poll_dnd():
            while True:
                dnd = self.get_dnd_flag()
                theme_name = "dnd" if dnd else "default"
                if theme_name != self.last_dnd_state:
                    logger.info(f"DND state changed to {dnd}")
                    self.last_dnd_state = theme_name
                    self.toggle(new_theme=theme_name)
                time.sleep(1) # we are using 1 to avoid frying the cpu

        threading.Thread(target=poll_dnd, daemon=True).start()
