from libqtile.lazy import lazy
from libqtile.bar import Bar
from libqtile.config import Screen
from libqtile.widget import (
    GroupBox,
    WindowName,
    CurrentLayout,
    Image,
    Systray,
    Battery,
    Clock,
    Volume,
    TaskList,
)
from libqtile.widget.net import Net
from libqtile.widget.spacer import Spacer
from libqtile.widget.textbox import TextBox
from libqtile.widget.cpu import CPU
from libqtile.widget.memory import Memory
from .colors import Colors
import os


class LapTopBar:
    def __init__(self) -> None:
        rp = Colors().rose_pine
        self.config_home = os.path.expanduser("~/.config")
        self.bar = Bar(
            [
                Spacer(length=5, background=rp["Iris"]),
                Image(
                    filename=f"{self.config_home}/qtile/icon/artixlinux-logo-flat.png",
                    background=rp["Iris"],
                    mouse_callbacks={
                        "Button1": lazy.spawn(
                            "sh /home/fs144/.config/rofi/launchers/ribbon/launcher.sh"
                        ),
                    },
                ),
                Spacer(length=5, background=rp["Iris"]),
                Spacer(length=5),
                GroupBox(
                    active=rp["Text"],
                    foreground=rp["Gold"],
                    inactive=rp["Highlight High"],
                    highlight_method="text",
                    block_highlight_text_color=rp["Text"],
                    highlight_color=rp["Gold"],
                    urgent_alert_method="line",
                    urgent_text=rp["Love"],
                    urgent_border=rp["Love"],
                    spacing=5,
                    this_current_screen_border=rp["Gold"],
                ),
                Spacer(length=10),
                WindowName(
                    format="{name}",
                    foreground=rp["Rose"],
                ),
                Spacer(length=10),
                Systray(
                    padding=15,
                ),
                Spacer(
                    length=15,
                ),
                Spacer(
                    length=15,
                ),
                Clock(
                    format=" %d/%m/%y %H:%M",
                    foreground=rp["Pine"],
                ),
                Spacer(
                    length=15,
                ),
                TextBox(
                    text=" ",
                    foreground=rp["Foam"],
                    mouse_callbacks={
                        "Button1": lazy.spawn("pavucontrol"),
                    },
                ),
                Volume(
                    foreground=rp["Foam"],
                ),
                Spacer(
                    length=15,
                ),
                Battery(
                    format="{char} {percent:2.0%}",
                    foreground=rp["Gold"],
                    low_foreground=rp["Love"],
                    charge_char=" ",
                    full_char=" ",
                    discharge_char=" ",
                    notify_below=20,
                    background=rp["Surface"],
                ),
                Spacer(
                    length=15,
                ),
                TextBox(
                    text=" ",
                    foreground=rp["Love"],
                    mouse_callbacks={
                        "Button1": lazy.spawn(
                            f"sh {self.config_home}/rofi/powermenu/power.sh"
                        ),
                    },
                ),
            ],
            background=rp["Base"],
            size=30,
        )


class MonitorBar:
    def __init__(self) -> None:
        rp = Colors().rose_pine
        self.config_home = os.path.expanduser("~/.config")
        self.bar = Bar(
            [
                Spacer(length=5),
                GroupBox(
                    active=rp["Text"],
                    foreground=rp["Gold"],
                    inactive=rp["Highlight High"],
                    highlight_method="text",
                    block_highlight_text_color=rp["Text"],
                    highlight_color=rp["Gold"],
                    urgent_alert_method="line",
                    urgent_text=rp["Love"],
                    urgent_border=rp["Love"],
                    spacing=5,
                    this_current_screen_border=rp["Gold"],
                ),
                Spacer(length=10),
                TaskList(
                    foreground=rp["Rose"],
                ),
                # WindowName(
                #     format="{name}",
                #     foreground=rp["Rose"],
                # ),
                Spacer(length=10),
                CurrentLayout(
                    foreground=rp["Iris"],
                    mouse_callback=lazy.next_layout(),
                ),
                Spacer(
                    length=15,
                ),
                Net(
                    format="龍 {down} ↓↑{up}",
                    foreground=rp["Rose"],
                ),
                Spacer(
                    length=15,
                ),
                Memory(
                    format="  {MemUsed:.0f}/{MemTotal:.0f} M",
                    foreground=rp["Pine"],
                ),
                Spacer(
                    length=15,
                ),
                TextBox(
                    text="ﴮ ",
                    foreground=rp["Foam"],
                ),
                CPU(
                    format="{freq_current}GHz | {load_percent}%",
                    foreground=rp["Foam"],
                ),
                Spacer(
                    length=15,
                ),
                Spacer(
                    length=15,
                ),
                TextBox(
                    text=" ",
                    foreground=rp["Love"],
                    mouse_callbacks={
                        "Button1": lazy.spawn(
                            f"sh {self.config_home}/rofi/powermenu/power.sh"
                        ),
                    },
                ),
            ],
            background=rp["Base"],
            size=30,
        )


class Screens:
    def return_screens(self):
        screens = [
            Screen(
                top=LapTopBar().bar,
            ),
            Screen(
                top=MonitorBar().bar,
            ),
        ]

        return screens
