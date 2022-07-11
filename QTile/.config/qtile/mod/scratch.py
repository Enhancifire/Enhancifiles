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
                    width=0.4,
                    x=0.3,
                    y=0.0,
                ),
                DropDown(
                    "bitwarden",
                    "bitwarden-desktop",
                    width=0.5,
                    height=0.5,
                    x=0.25,
                    y=0.25,
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
        ]

    def return_scratch(self):
        return self.scratch, self.keys
