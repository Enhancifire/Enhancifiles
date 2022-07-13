from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy

from .defaults import MOV_KEY, SWITCH_KEY


def export_groups():
    groups = [
        Group(
            "1",
            label="",
            layout="max",
            matches=[Match(wm_class="brave-browser")],
        ),
        Group(
            "2",
            label="",
            layout="monadtall",
        ),
        Group(
            "3",
            label="",
            layout="monadtall",
        ),
        Group(
            "4",
            label="",
            layout="monadtall",
        ),
        Group(
            "5",
            label="",
            layout="monadtall",
        ),
        Group(
            "6",
            label="",
            layout="monadtall",
        ),
        Group(
            "7",
            label="",
            layout="monadtall",
        ),
        Group(
            "8",
            label="",
            layout="max",
            matches=[Match(wm_class="firefox")],
        ),
        Group(
            "9",
            label="",
            layout="max",
            matches=[Match(wm_class="obsidian")],
        ),
    ]

    keys = []
    for i in groups:
        keys.extend(
            [
                Key(
                    MOV_KEY,
                    i.name,
                    lazy.group[i.name].toscreen(),
                    desc="Switch to {} group".format(i.name),
                ),
                Key(
                    SWITCH_KEY,
                    i.name,
                    lazy.window.togroup(i.name, switch_group=True),
                    desc="Switch to {} group".format(i.name),
                ),
            ]
        )

    return groups, keys
