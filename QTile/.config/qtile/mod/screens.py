from libqtile.lazy import lazy
from libqtile.bar import Bar
from libqtile.config import Screen
from libqtile.widget import (
    GroupBox,
    WindowName,
    CurrentLayout,
    CurrentLayoutIcon,
    Systray,
    Battery,
    Clock,
)
from libqtile.widget.net import Net
from libqtile.widget.spacer import Spacer
from libqtile.widget.cpu import CPU
from .colors import Colors


class TopBar:
    def __init__(self) -> None:
        rp = Colors().rose_pine
        self.bar = Bar(
            [
                GroupBox(
                    active=rp["Foam"],
                    inactive=rp["Iris"],
                    highlight_method="line",
                    block_highlight_text_color=rp["Foam"],
                    highlight_color=rp["Highlight Med"],
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
                Spacer(length=10),
                CurrentLayoutIcon(
                    scale=0.7,
                    foreground=rp["Iris"],
                ),
                CurrentLayout(
                    foreground=rp["Iris"],
                    mouse_callback=lazy.next_layout(),
                ),
                Spacer(length=10),
                Net(
                    format="{down} ↓↑{up}",
                    foreground=rp["Rose"],
                ),
                Spacer(length=10),
                Clock(
                    format="%Y-%m-%d %a %I:%M %p",
                    foreground=rp["Foam"],
                ),
                Spacer(length=10),
                CPU(
                    format="CPU {load_percent}%",
                    foreground=rp["Love"],
                ),
                Spacer(length=10),
                Battery(
                    format="BAT  {char} {percent:2.0%}",
                    foreground=rp["Gold"],
                ),
                Spacer(length=10),
            ],
            background=rp["Overlay"],
            size=30,
        )


class Screens:
    def return_screens(self):
        screens = [
            Screen(
                top=TopBar().bar,
            ),
        ]

        return screens
