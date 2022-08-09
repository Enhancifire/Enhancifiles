from libqtile import layout
from libqtile.config import Match
from .colors import Colors


def return_layouts():
    rp = Colors().rose_pine
    layouts = [
        layout.MonadTall(
            border_normal=rp["Pine"],
            border_focus=rp["Gold"],
            border_width=3,
            border_on_single=True,
            margin=10,
            margin_on_single=False,
        ),
        layout.Columns(
            border_width=2,
            border_on_single=True,
            margin=5,
            margin_on_single=True,
            border_focus=rp["Gold"],
        ),
        layout.Max(),
        # Try more layouts by unleashing below layouts.
        # layout.Stack(num_stacks=2),
        # layout.Bsp(),
        # layout.Matrix(),
        # layout.MonadWide(),
        # layout.RatioTile(),
        # layout.Tile(),
        # layout.TreeTab(),
        # layout.VerticalTile(),
        # layout.Zoomy(),
    ]

    floating_layout = layout.Floating(
        float_rules=[
            # Run the utility of `xprop` to see the wm class and name of an X client.
            *layout.Floating.default_float_rules,
            Match(wm_class="confirmreset"),  # gitk
            Match(title="Friends List"),
            Match(title="Steam - News"),
            Match(wm_class="makebranch"),  # gitk
            Match(wm_class="maketag"),  # gitk
            Match(wm_class="ssh-askpass"),  # ssh-askpass
            Match(title="branchdialog"),  # gitk
            Match(title="pinentry"),  # GPG key password entry
            Match(wm_class="pavucontrol"),
            Match(wm_class="bitwarden"),
        ]
    )

    return layouts, floating_layout
