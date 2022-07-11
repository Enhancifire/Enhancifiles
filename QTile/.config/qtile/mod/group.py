from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy

from .defaults import MOV_KEY, SWITCH_KEY


def export_groups():
    groups = [
        Group("1", label="一", matches=[Match(wm_class="brave-browser")], layout="max"),
        Group("2", label="二", layout="monadtall"),
        Group("3", label="三", layout="monadtall"),
        Group("4", label="四", layout="monadtall"),
        Group("5", label="五", layout="monadtall"),
        Group("6", label="六", layout="monadtall"),
        Group("7", label="七", layout="monadtall"),
        Group("8", label="八", layout="max", matches=[Match(wm_class="obsidian")]),
        Group("9", label="九", layout="max"),
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
