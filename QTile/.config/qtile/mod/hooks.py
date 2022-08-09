import os
import subprocess
from libqtile import hook
from libqtile.lazy import lazy


@hook.subscribe.startup_once
def startup():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])


@hook.subscribe.layout_change
def layout_notify(layout, group):
    lazy.spawn(["notify-send", str(group.info())])


@hook.subscribe.group_window_add
def groupadd(group, win):
    lazy.spawn(["notify-send", group.info()])
