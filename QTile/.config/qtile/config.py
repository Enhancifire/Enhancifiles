# Library Imports
from mod.keybinds import KeyBinds, MouseBinds
import mod.layouts as lay
import mod.group as grp
from mod.screens import Screens
from mod.scratch import Scratch
import mod.hooks

# Groups and Group Keybindings
groups, group_keys = grp.export_groups()


# Keybindings
keys = KeyBinds().export_keybinds()
mouse = MouseBinds().export_mouse_keybinds()
keys.extend([*group_keys])

# Scratchpads
scratch_group, scratch_keys = Scratch().return_scratch()
groups.append(scratch_group)
keys.extend([*scratch_keys])

# Layouts
layouts, floating_layout = lay.return_layouts()

# Screens
screens = Screens().return_screens()

# Widgets
widget_defaults = dict(
    font="sans",
    fontsize=20,
    padding=3,
)
extension_defaults = widget_defaults.copy()


# Some Settings
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "QTile"
