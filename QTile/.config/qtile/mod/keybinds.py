from libqtile.config import Click, Drag, Key
from libqtile.lazy import lazy

from .defaults import (
    MOV_KEY,
    SS_KEY,
    SWITCH_KEY,
    KILL_KEY,
    SIZE_KEY,
    POWER_KEY,
    APP_KEY,
    FLOAT_KEY,
)

from .defaults import TERM, FILES, BROWSER
import os
import subprocess


class KeyBinds:
    "Key Bindings for QTile"

    def __init__(self) -> None:
        self.keys = []

    def movement_binds(self):
        movment_keys = [
            Key(MOV_KEY, "h", lazy.layout.left(), desc="Move focus to left"),
            Key(MOV_KEY, "l", lazy.layout.right(), desc="Move focus to right"),
            Key(MOV_KEY, "j", lazy.layout.down(), desc="Move focus down"),
            Key(MOV_KEY, "k", lazy.layout.up(), desc="Move focus up"),
            # Move windows between left/right columns or move up/down in current stack.
            # Moving out of range in Columns layout will create new column.
            Key(
                SWITCH_KEY,
                "h",
                lazy.layout.shuffle_left(),
                desc="Move window to the left",
            ),
            Key(
                SWITCH_KEY,
                "l",
                lazy.layout.shuffle_right(),
                desc="Move window to the right",
            ),
            Key(
                SWITCH_KEY,
                "j",
                lazy.layout.shuffle_down(),
                desc="Move window down",
            ),
            Key(
                SWITCH_KEY,
                "k",
                lazy.layout.shuffle_up(),
                desc="Move window up",
            ),
            Key(
                MOV_KEY,
                "m",
                lazy.next_screen(),
                desc="Change Monitor Focus",
            ),
        ]
        self.keys.extend(movment_keys)

    def window_size_binds(self):
        size_keys = [
            Key(
                SIZE_KEY,
                "h",
                lazy.layout.grow_left(),
                desc="Grow window to the left",
            ),
            Key(
                SIZE_KEY,
                "l",
                lazy.layout.grow_right(),
                desc="Grow window to the right",
            ),
            Key(
                SIZE_KEY,
                "j",
                lazy.layout.grow_down(),
                desc="Grow window down",
            ),
            Key(
                SIZE_KEY,
                "k",
                lazy.layout.grow_up(),
                desc="Grow window up",
            ),
            Key(
                MOV_KEY,
                "n",
                lazy.layout.normalize(),
                desc="Reset all window sizes",
            ),
        ]

        self.keys.extend(size_keys)

    def application_keys(self):
        app_keys = [
            Key(
                KILL_KEY,
                "q",
                lazy.window.kill(),
                desc="Kill focused window",
            ),
            Key(
                APP_KEY,
                "f",
                lazy.window.toggle_fullscreen(),
                desc="Toggle Fullscreen",
            ),
            Key(
                FLOAT_KEY,
                "space",
                lazy.window.toggle_floating(),
                desc="Toggle Floating window",
            ),
            Key(
                SS_KEY,
                "s",
                lazy.spawn("flameshot gui"),
                desc="Take a Screenshot",
            ),
        ]

        self.keys.extend(app_keys)

    def layout_keys(self):
        lay_keys = [
            Key(
                SWITCH_KEY,
                "Return",
                lazy.layout.toggle_split(),
                desc="Toggle between split and unsplit sides of stack",
            ),
            Key(MOV_KEY, "Tab", lazy.next_layout(),
                desc="Toggle between layouts"),
        ]

        self.keys.extend(lay_keys)

    def power_keys(self):
        home = os.path.expanduser("~")
        pow_keys = [
            Key(
                POWER_KEY,
                "r",
                lazy.reload_config(),
                desc="Reload the config",
            ),
            Key(
                POWER_KEY,
                "q",
                lazy.shutdown(),
                desc="Shutdown Qtile",
            ),
            Key(
                POWER_KEY,
                "c",
                lazy.spawn(f"sh {home}/.config/rofi/powermenu/powermenu.sh"),
                desc="Shutdown Prompt",
            ),
            Key(
                POWER_KEY,
                "p",
                lazy.spawn(f"{home}/.scripts/qtilescripts/power.py"),
                desc="Power Prompt",
            ),
            Key(
                POWER_KEY,
                'l',
                lazy.spawn(f"python {home}/.config/qtile/mod/scripts/lock.py"),
                desc="Lock with Random Wallpaper",
            ),
            Key(
                [],
                "XF86MonBrightnessUp",
                lazy.spawn("brightnessctl set +5%"),
            ),
            Key(
                [],
                "XF86MonBrightnessDown",
                lazy.spawn("brightnessctl set 5%-"),
            ),
        ]
        self.keys.extend(pow_keys)

    def launcher_keys(self):
        launch_keys = [
            Key(
                APP_KEY,
                "Return",
                lazy.spawn(TERM),
                desc="Launch terminal",
            ),
            Key(
                APP_KEY,
                "r",
                lazy.spawn("rofi -show drun"),
                desc="Spawn Application Launcher",
            ),
            Key(
                APP_KEY,
                "e",
                lazy.spawn(FILES),
                desc="Spawn File Manager",
            ),
            Key(
                APP_KEY,
                "b",
                lazy.spawn(BROWSER),
                desc="Spawn Browser",
            ),
        ]
        self.keys.extend(launch_keys)

    def export_keybinds(self):
        self.movement_binds()
        self.window_size_binds()
        self.application_keys()
        self.layout_keys()
        self.power_keys()
        self.launcher_keys()

        return self.keys


class MouseBinds:
    "Keybindings for Mouse Usage"

    def export_mouse_keybinds(self):
        # Drag floating layouts.
        mouse = [
            Drag(
                MOV_KEY,
                "Button1",
                lazy.window.set_position_floating(),
                start=lazy.window.get_position(),
            ),
            Drag(
                MOV_KEY,
                "Button3",
                lazy.window.set_size_floating(),
                start=lazy.window.get_size(),
            ),
            Click(MOV_KEY, "Button2", lazy.window.bring_to_front()),
        ]

        return mouse
