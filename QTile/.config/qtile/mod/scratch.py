from libqtile.config import ScratchPad, DropDown
from libqtile.config import Key
from libqtile.lazy import lazy
from .defaults import SCRATCH_KEY


class Scratch:
    def __init__(self) -> None:
        self.scratch = ScratchPad(
            "scratchpad",
            [
                DropDown(
                    "term",
                    "kitty",
                    width=0.8,
                    x=0.1,
                    y=0.0,
                ),
                DropDown(
                    "bitwarden",
                    "Bitwarden",
                    width=0.5,
                    height=0.5,
                    x=0.25,
                    y=0.25,
                ),
                DropDown(
                    "audio",
                    "pavucontrol",
                    width=0.7,
                    height=0.7,
                    x=0.15,
                    y=0.15,
                ),
                DropDown(
                    "ranger",
                    "kitty ranger",
                    width=0.8,
                    height=0.5,
                    x=0.1,
                    y=0.2,
                ),
            ],
        )

        self.keys = [
            Key(
                SCRATCH_KEY,
                "1",
                lazy.group["scratchpad"].dropdown_toggle("term"),
            ),
            Key(
                SCRATCH_KEY,
                "2",
                lazy.group["scratchpad"].dropdown_toggle("bitwarden"),
            ),
            Key(
                SCRATCH_KEY,
                "3",
                lazy.group["scratchpad"].dropdown_toggle("audio"),
            ),
            Key(
                SCRATCH_KEY,
                "f",
                lazy.group["scratchpad"].dropdown_toggle("ranger"),
            ),
        ]

    def return_scratch(self):
        return self.scratch, self.keys
